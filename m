From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Sep 2016 15:44:39 +0000
Subject: [PATCH 5/5] ISDN-Gigaset: Enclose two expressions for the sizeof operator by parentheses
Message-Id: <e97b38b6-8c02-6733-8b57-9786bfb911a6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <6d4bbb77-914f-19b8-a1a9-2731d1158612@users.sourceforge.net>
In-Reply-To: <6d4bbb77-914f-19b8-a1a9-2731d1158612@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>, Paul Bolle <pebolle@tiscali.nl>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Sep 2016 17:03:56 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" can point information out like the following.

WARNING: sizeof =85 should be sizeof(=85)

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/isdn/gigaset/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/isdn/gigaset/common.c b/drivers/isdn/gigaset/common.c
index 2e9382f..d901ed7 100644
--- a/drivers/isdn/gigaset/common.c
+++ b/drivers/isdn/gigaset/common.c
@@ -53,7 +53,7 @@ void gigaset_dbg_buffer(enum debuglevel level, const unsi=
gned char *msg,
 {
 	unsigned char outbuf[80];
 	unsigned char c;
-	size_t space =3D sizeof outbuf - 1;
+	size_t space =3D sizeof(outbuf - 1);
 	unsigned char *out =3D outbuf;
 	size_t numin =3D len;
=20
@@ -1079,7 +1079,7 @@ struct gigaset_driver *gigaset_initdriver(unsigned mi=
nor, unsigned minors,
 	unsigned long flags;
 	unsigned i;
=20
-	drv =3D kmalloc(sizeof *drv, GFP_KERNEL);
+	drv =3D kmalloc(sizeof(*drv), GFP_KERNEL);
 	if (!drv)
 		return NULL;
=20
--=20
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
