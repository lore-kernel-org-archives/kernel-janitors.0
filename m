From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Sep 2016 11:14:07 +0000
Subject: [PATCH 4/5] ISDN-CAPI: Adjust checks for null pointers in four functions
Message-Id: <20395fb4-0899-eb2a-c0ce-cca8bf6fd6f0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <be07f84d-fc84-e47d-207e-aedd8c960151@users.sourceforge.net>
In-Reply-To: <be07f84d-fc84-e47d-207e-aedd8c960151@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netdev@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Sep 2016 12:26:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" can point information out like the following.

Comparison to NULL could be written !=E2=80=A6

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/isdn/capi/capidrv.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/isdn/capi/capidrv.c b/drivers/isdn/capi/capidrv.c
index bd614e3..83f756d 100644
--- a/drivers/isdn/capi/capidrv.c
+++ b/drivers/isdn/capi/capidrv.c
@@ -334,8 +334,7 @@ static capidrv_plci *new_plci(capidrv_contr *card, int =
chan)
 	capidrv_plci *plcip;
=20
 	plcip =3D kzalloc(sizeof(capidrv_plci), GFP_ATOMIC);
-
-	if (plcip =3D NULL)
+	if (!plcip)
 		return NULL;
=20
 	plcip->state =3D ST_PLCI_NONE;
@@ -403,8 +402,7 @@ static inline capidrv_ncci *new_ncci(capidrv_contr *car=
d,
 	capidrv_ncci *nccip;
=20
 	nccip =3D kzalloc(sizeof(capidrv_ncci), GFP_ATOMIC);
-
-	if (nccip =3D NULL)
+	if (!nccip)
 		return NULL;
=20
 	nccip->ncci =3D ncci;
@@ -757,7 +755,7 @@ static inline int new_bchan(capidrv_contr *card)
 {
 	int i;
 	for (i =3D 0; i < card->nbchan; i++) {
-		if (card->bchans[i].plcip =3D NULL) {
+		if (!card->bchans[i].plcip) {
 			card->bchans[i].disconnecting =3D 0;
 			return i;
 		}
@@ -2192,7 +2190,7 @@ static void enable_dchannel_trace(capidrv_contr *card)
 		       card->name, errcode);
 		return;
 	}
-	if (strstr(manufacturer, "AVM") =3D NULL) {
+	if (!strstr(manufacturer, "AVM")) {
 		printk(KERN_ERR "%s: not from AVM, no d-channel trace possible (%s)\n",
 		       card->name, manufacturer);
 		return;
--=20
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
