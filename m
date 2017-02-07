From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 07 Feb 2017 19:50:24 +0000
Subject: [PATCH 08/18] HID: Adjust five checks for null pointers
Message-Id: <8dbffcc9-34e2-5e1d-e4f5-342786f91c53@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <edd25fcd-8625-2469-fa28-2315f81b6b8e@users.sourceforge.net>
In-Reply-To: <edd25fcd-8625-2469-fa28-2315f81b6b8e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, =?UTF-8?Q?Bruno_Pr=c3=a9mont?= <bonbons@linux-vserver.org>, Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 7 Feb 2017 19:15:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written !=E2=80=A6

Thus fix affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hid/hid-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 1f75c1c022f0..f4ea3590954c 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -959,7 +959,7 @@ int hid_open_report(struct hid_device *device)
 	size =3D device->dev_rsize;
=20
 	buf =3D kmemdup(start, size, GFP_KERNEL);
-	if (buf =3D NULL)
+	if (!buf)
 		return -ENOMEM;
=20
 	if (device->driver->report_fixup)
@@ -969,7 +969,7 @@ int hid_open_report(struct hid_device *device)
=20
 	start =3D kmemdup(start, size, GFP_KERNEL);
 	kfree(buf);
-	if (start =3D NULL)
+	if (!start)
 		return -ENOMEM;
=20
 	device->rdesc =3D start;
@@ -1414,7 +1414,7 @@ static struct hid_report *hid_get_report(struct hid_r=
eport_enum *report_enum,
 		n =3D *data;
=20
 	report =3D report_enum->report_id_hash[n];
-	if (report =3D NULL)
+	if (!report)
 		dbg_hid("undefined report_id %u received\n", n);
=20
 	return report;
@@ -2222,7 +2222,7 @@ static int hid_device_probe(struct device *dev)
=20
 	if (!hdev->driver) {
 		id =3D hid_match_device(hdev, hdrv);
-		if (id =3D NULL) {
+		if (!id) {
 			ret =3D -ENODEV;
 			goto unlock;
 		}
@@ -2719,7 +2719,7 @@ struct hid_device *hid_allocate_device(void)
 	int ret =3D -ENOMEM;
=20
 	hdev =3D kzalloc(sizeof(*hdev), GFP_KERNEL);
-	if (hdev =3D NULL)
+	if (!hdev)
 		return ERR_PTR(ret);
=20
 	device_initialize(&hdev->dev);
--=20
2.11.1

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
