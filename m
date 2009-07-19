From: Julia Lawall <julia@diku.dk>
Date: Sun, 19 Jul 2009 15:29:57 +0000
Subject: [PATCH 8/10] drivers/usb/storage: Drop an unneeded a NULL test
Message-Id: <Pine.LNX.4.64.0907191729380.16542@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mdharm-usb@one-eyed-alien.net, linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In each case, the NULL test is not necessary because the function is static
and at the only places where it is called, the us argument has already been
dereferenced.

The semantic patch that finds the problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T;
expression E,E1;
identifier i,fld;
statement S;
@@

- T i =3D E->fld;
+ T i;
  ... when !=3D E=E1
      when !=3D i
  if (E =3D NULL||...) S
+ i =3D E->fld;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/usb/storage/datafab.c  |    4 ++--
 drivers/usb/storage/jumpshot.c |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/storage/datafab.c b/drivers/usb/storage/datafab.c
index 2b6e565..ded836b 100644
--- a/drivers/usb/storage/datafab.c
+++ b/drivers/usb/storage/datafab.c
@@ -334,7 +334,7 @@ static int datafab_determine_lun(struct us_data *us,
 	unsigned char *buf;
 	int count =3D 0, rc;
=20
-	if (!us || !info)
+	if (!info)
 		return USB_STOR_TRANSPORT_ERROR;
=20
 	memcpy(command, scommand, 8);
@@ -399,7 +399,7 @@ static int datafab_id_device(struct us_data *us,
 	unsigned char *reply;
 	int rc;
=20
-	if (!us || !info)
+	if (!info)
 		return USB_STOR_TRANSPORT_ERROR;
=20
 	if (info->lun =3D -1) {
diff --git a/drivers/usb/storage/jumpshot.c b/drivers/usb/storage/jumpshot.c
index 1c69420..6168596 100644
--- a/drivers/usb/storage/jumpshot.c
+++ b/drivers/usb/storage/jumpshot.c
@@ -335,7 +335,7 @@ static int jumpshot_id_device(struct us_data *us,
 	unsigned char *reply;
 	int 	 rc;
=20
-	if (!us || !info)
+	if (!info)
 		return USB_STOR_TRANSPORT_ERROR;
=20
 	command[0] =3D 0xE0;
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
