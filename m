From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 15 May 2005 18:21:27 +0000
Subject: [KJ] [UPDATE PATCH 2/3] Remove duplicate file in
Message-Id: <20050515182127.GD792@nuerscht.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33932143064361142=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============33932143064361142==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

wanpipe.txt and wan-router.txt in Documentation/networking
contain the exact same information (diff between the two shows no
difference). This patch removes the reference to this document in
Documentation/networking/00-INDEX as pointed out by Randy Dunlap.

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN -X dontdiff linux-2.6.12-rc4/Documentation/networking/00-INDEX linux-2.6.12-rc4-tk/Documentation/networking/00-INDEX
--- linux-2.6.12-rc4/Documentation/networking/00-INDEX	2005-03-02 08:38:18.000000000 +0100
+++ linux-2.6.12-rc4-tk/Documentation/networking/00-INDEX	2005-05-15 20:07:39.349701112 +0200
@@ -114,9 +114,7 @@ tuntap.txt
 vortex.txt
 	- info on using 3Com Vortex (3c590, 3c592, 3c595, 3c597) Ethernet cards.
 wan-router.txt
-	- Wan router documentation
-wanpipe.txt
-	- WANPIPE(tm) Multiprotocol WAN Driver for Linux WAN Router
+	- WAN router documentation
 wavelan.txt
 	- AT&T GIS (nee NCR) WaveLAN card: An Ethernet-like radio transceiver
 x25.txt

--===============33932143064361142==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33932143064361142==--
