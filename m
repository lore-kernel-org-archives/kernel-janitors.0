From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 14:32:29 +0000
Subject: [PATCH 7/7] cfag12864b: Adjust two checks for null pointers in cfag12864b_init()
Message-Id: <353dd8b8-9922-8e1b-7c88-9cb425010524@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <3d24b514-4e99-86ea-d69e-49a0b1edd286@users.sourceforge.net>
In-Reply-To: <3d24b514-4e99-86ea-d69e-49a0b1edd286@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 16:06:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" can point information out like the following.

Comparison to NULL could be written !=E2=80=A6

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/auxdisplay/cfag12864b.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/auxdisplay/cfag12864b.c b/drivers/auxdisplay/cfag12864=
b.c
index b2533e2..3956b9f 100644
--- a/drivers/auxdisplay/cfag12864b.c
+++ b/drivers/auxdisplay/cfag12864b.c
@@ -338,7 +338,7 @@ static int __init cfag12864b_init(void)
 	BUILD_BUG_ON(PAGE_SIZE < CFAG12864B_SIZE);
=20
 	cfag12864b_buffer =3D (unsigned char *) get_zeroed_page(GFP_KERNEL);
-	if (cfag12864b_buffer =3D NULL) {
+	if (!cfag12864b_buffer) {
 		printk(KERN_ERR CFAG12864B_NAME ": ERROR: "
 			"can't get a free page\n");
 		return -ENOMEM;
@@ -351,7 +351,7 @@ static int __init cfag12864b_init(void)
 		goto free_buffer;
=20
 	cfag12864b_workqueue =3D create_singlethread_workqueue(CFAG12864B_NAME);
-	if (cfag12864b_workqueue =3D NULL)
+	if (!cfag12864b_workqueue)
 		goto free_cache;
=20
 	cfag12864b_clear();
--=20
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
