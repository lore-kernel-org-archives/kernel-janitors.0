From: Julia Lawall <julia@diku.dk>
Date: Sun, 19 Jul 2009 15:26:13 +0000
Subject: [PATCH 3/10] drivers/hid: Move dereferences below a NULL test
Message-Id: <Pine.LNX.4.64.0907191725530.16542@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: jkosina@suse.cz, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If the NULL test is necessary, then the dereferences should be moved below
the NULL test.

The semantic patch that makes this change is as follows:
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
 drivers/hid/hid-core.c              |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 5ebbb8a..ca69cc3 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1072,8 +1072,8 @@ EXPORT_SYMBOL_GPL(hid_report_raw_event);
  */
 int hid_input_report(struct hid_device *hid, int type, u8 *data, int size,=
 int interrupt)
 {
-	struct hid_report_enum *report_enum =3D hid->report_enum + type;
-	struct hid_driver *hdrv =3D hid->driver;
+	struct hid_report_enum *report_enum;
+	struct hid_driver *hdrv;
 	struct hid_report *report;
 	char *buf;
 	unsigned int i;
@@ -1081,6 +1081,8 @@ int hid_input_report(struct hid_device *hid, int type=
, u8 *data, int size, int i
=20
 	if (!hid || !hid->driver)
 		return -ENODEV;
+	report_enum =3D hid->report_enum + type;
+	hdrv =3D hid->driver;
=20
 	if (!size) {
 		dbg_hid("empty report\n");
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
