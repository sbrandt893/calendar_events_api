<?php
// database connection
$servername = "127.0.0.1";
$username = "root";
$password = "";
$dbname = "calendar";
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


// get action for the request
$action = $_GET['action'];

// check the action and call the corresponding function
if ($action === 'addEvent') {
  // JSON-Daten aus dem Request Body parsen
  $data = json_decode(file_get_contents("php://input"), true);
  if (isset($data['date']) && isset($data['title']) && isset($data['description'])) {
      $date = $data['date'];
      $title = $data['title'];
      $description = $data['description'];
      $result = addEvent($date, $title, $description);
      echo json_encode($result);
  } else {
      echo json_encode(array("error" => "Ungültige Daten."));
  }
} 
else if ($action === 'getEventsForDate') {
    // Abrufen von Ereignissen für ein bestimmtes Datum
    if (isset($_GET['date'])) {
        $date = $_GET['date'];
        $events = getEvents($date);
        echo json_encode($events);
    } else {
        echo json_encode(array("error" => "Bitte geben Sie ein Datum an."));
    }
}
else if ($action === 'deleteEventById') {
    // Überprüfen, ob die ID vorhanden ist
    if (isset($_GET['id'])) {
        // ID aus der Anfrage abrufen
        $id = $_GET['id'];
        // Die Funktion deleteEventById aufrufen und das Ergebnis ausgeben
        echo json_encode(deleteEventById($id));
    } else {
        // Fehler, wenn die ID nicht vorhanden ist
        echo json_encode(array("error" => "ID nicht angegeben."));
    }
} else {
    echo json_encode(array("error" => "Ungültige Aktion."));
}



// Funktion zum Hinzufügen eines neuen Ereignisses
function addEvent($date, $title, $description) {
    global $conn;
    $sql = "INSERT INTO events (date, title, description) VALUES ('$date', '$title', '$description')";
    if ($conn->query($sql) === TRUE) {
        $id = $conn->insert_id;
        // Das neu erstellte Ereignisobjekt zurückgeben
        return array("id" => $id, "date" => $date, "title" => $title, "description" => $description);
    } else {
        return null; // Fehler: Ereignis konnte nicht hinzugefügt werden
    }
}



// Funktion zum Abrufen von Ereignissen für ein bestimmtes Datum
function getEvents($date) {
    global $conn;
    $sql = "SELECT * FROM events WHERE date = '$date'";
    $result = $conn->query($sql);
    $events = array();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $events[] = $row;
        }
    }
    return $events;
}


// Funktion zum Löschen eines Ereignisses anhand der ID
function deleteEventById($id) {
    global $conn;
    $sql = "DELETE FROM events WHERE id = '$id'";
    if ($conn->query($sql) === TRUE) {
        // Überprüfen, ob eine Zeile betroffen war
        if ($conn->affected_rows > 0) {
            return array("success" => true, "message" => "Event with ID $id was deleted successfully.");
        } else {
            return array("success" => false, "message" => "No event found with ID $id.");
        }
    } else {
        return array("success" => false, "message" => "Error deleting event: " . $conn->error);
    }
}




// Verbindung schließen
$conn->close();
?>
