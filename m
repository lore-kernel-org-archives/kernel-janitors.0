From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 04 Sep 2007 10:22:59 +0000
Subject: [PATCH] Documentation:  Remove references to dead "cyclades=" boot
Message-Id: <Pine.LNX.4.64.0709040622420.740@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

  since there is no trace of a "cy_setup" routine anywhere, i'm
guessing that this boot-time parm is long since defunct.


 Documentation/kernel-parameters.txt |    2 --
 drivers/char/cyclades.c             |    2 --
 2 files changed, 4 deletions(-)

diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-par=
ameters.txt
index b41cde3..926a646 100644
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@ -484,8 +484,6 @@ and is between 256 and 4096 characters. It is defined i=
n the file
 	cs89x0_media=3D	[HW,NET]
 			Format: { rj45 | aui | bnc }

-	cyclades=3D	[HW,SERIAL] Cyclades multi-serial port adapter.
-
 	dasd=3D		[HW,NET]
 			See header of drivers/s390/block/dasd_devmap.c.

diff --git a/drivers/char/cyclades.c b/drivers/char/cyclades.c
index 9e0adfe..2ec5ad7 100644
--- a/drivers/char/cyclades.c
+++ b/drivers/char/cyclades.c
@@ -727,8 +727,6 @@ static struct tty_driver *cy_serial_driver;
    driver to probe addresses at a different address, add it to
    this table.  If the driver is probing some other board and
    causing problems, remove the offending address from this table.
-   The cy_setup function extracts additional addresses from the
-   boot options line.  The form is "cyclades=ADdress,address..."
 */

 static unsigned int cy_isa_addresses[] =3D {

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
