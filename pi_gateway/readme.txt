Hallo,

1. Rasbian lite version 9 auf sd-Karte (nicht buster v10) die richtige version ist hier:

https://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-04-09/2019-04-08-raspbian-stretch-lite.zip

2.1 in boot die datei ssh (ohne ext. und ohne Inhalt) anlegen

2.2 aus der zipdatei die beiden einträge aus der config.txt in die config.txt auf der sd-karte ans ende anfügen

3. Booten und mit pi raspberry über ssh einloggen (ip vom dhcp-server auslesen)

4. sudo su

5. mit passwd ein passwort für root eintragen

6. nano /etc/ssh/sshd_config => permitrootlogin kommentar entfernen und yes mit vorgestelltem leerzeichen direkt hinter permit... eintragen und den rest in der zeile löschen

7. ssh neu starten /etc/init.d/ssh restart

8. pi neu booten 

9. die Dateien im Anhang entpacken und nach /root kopieren. Allen dateien ausführungsrechte geben, bis auf die config.txt.

ins root wechseln

10. in_1... den Namen des Gateways eintragen

11. ttn_setup-01.sh ausführen (eingaben mit enter übergeben, da wird später noch was gefragt)

12. nach dem boot wieder ins root wechseln und ttn_setup-02 ausführen. Dann wird nochmal gebootet und overlayFS ist installiert. wenn dann nochmal was geändert werden muss, immer erst lpie disable, dann neu booten, Änderungen machen und am ende wider overlayFS mit lpie enable einschalten und neu booten.

lg

rainer (die schreibfehler schwnkre ich dr) 


ttn-eberswalde-02
EUI B827EBFFFE7FFFFB

ttn-eberswalde-mobile
EUI B827EBFFFE2D5611

ttn-eberswalde-05(Heinz)
EUI B827EBFFFE3228CD

