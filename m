From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 09 Sep 2007 06:19:44 +0000
Subject: [PATCH] Documentation:  Correct "dmascc=" to read "dmascc.io=".
Message-Id: <Pine.LNX.4.64.0709090218210.20776@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

 Documentation/kernel-parameters.txt |    2 +-
 drivers/net/hamradio/Kconfig        |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-par=
ameters.txt
index b41cde3..318b284 100644
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@ -543,7 +543,7 @@ and is between 256 and 4096 characters. It is defined i=
n the file
 			See drivers/char/README.epca and
 			Documentation/digiepca.txt.

-	dmascc=3D		[HW,AX25,SERIAL] AX.25 Z80SCC driver with DMA
+	dmascc.io=3D	[HW,AX25,SERIAL] AX.25 Z80SCC driver with DMA
 			support available.
 			Format: <io_dev0>[,<io_dev1>[,..<io_dev32>]]

diff --git a/drivers/net/hamradio/Kconfig b/drivers/net/hamradio/Kconfig
index 36d2c7d..62d5d5c 100644
--- a/drivers/net/hamradio/Kconfig
+++ b/drivers/net/hamradio/Kconfig
@@ -64,7 +64,7 @@ config DMASCC
 	  dmascc. If you don't pass any parameter to the driver, all
 	  possible I/O addresses are probed. This could irritate other devices
 	  that are currently not in use. You may specify the list of addresses
-	  to be probed by "dmascc=ADdr1,addr2,..." (when compiled into the
+	  to be probed by "dmascc.io=ADdr1,addr2,..." (when compiled into the
 	  kernel image) or "io=ADdr1,addr2,..." (when loaded as a module). The
 	  network interfaces will be called dmascc0 and dmascc1 for the board
 	  detected first, dmascc2 and dmascc3 for the second one, and so on.

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
