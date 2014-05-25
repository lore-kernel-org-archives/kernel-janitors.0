From: =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>
Date: Sun, 25 May 2014 17:32:43 +0000
Subject: [PATCH] wan: time_before()
Message-Id: <1401039163-10727-1-git-send-email-manuel.schoelling@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kevin.curtis@farsite.co.uk
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>

To be future-proof and for better readability the time comparisons are
modified to use time_before() instead of plain, error-prone math.

Signed-off-by: Manuel Sch=C3=B6lling <manuel.schoelling@gmx.de>
---
 drivers/net/wan/farsync.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wan/farsync.c b/drivers/net/wan/farsync.c
index bcfff0d..d007f60 100644
--- a/drivers/net/wan/farsync.c
+++ b/drivers/net/wan/farsync.c
@@ -697,14 +697,14 @@ fst_cpureset(struct fst_card_info *card)
 		 * We are delaying here to allow the 9054 to reset itself
 		 */
 		j =3D jiffies + 1;
-		while (jiffies < j)
+		while (time_before(jiffies, j))
 			/* Do nothing */ ;
 		outw(0x240f, card->pci_conf + CNTRL_9054 + 2);
 		/*
 		 * We are delaying here to allow the 9054 to reload its eeprom
 		 */
 		j =3D jiffies + 1;
-		while (jiffies < j)
+		while (time_before(jiffies, j))
 			/* Do nothing */ ;
 		outw(0x040f, card->pci_conf + CNTRL_9054 + 2);
=20
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
