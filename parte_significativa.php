 <table>
     <tr>
         <th>id addetto</th>
         <th>punto controllo</th>
         <th>inizio controllo</th>
         <th>durata controllo</th>
         <th>note</th>
     </tr>
     <?php
        $connection = mysqli_connect("localhost", "root", "", "aeroportomln");
        $query = "SELECT * FROM controlli";
        $controlli = mysqli_query($connection, $query);
        echo "<tr>";
        while ($row = mysqli_fetch_array($controlli)) {
            echo "<td>$row[id_addetto]</td>";
            echo "<td>$row[punto_controllo]</td>";
            echo "<td>$row[inizio_controllo]</td>";
            echo "<td>$row[durata_controllo]</td>";
            echo "<td>$row[note]</td>";
        }
        echo "</tr>";
        ?>
 </table>