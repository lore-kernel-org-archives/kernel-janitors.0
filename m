From: =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>
Date: Sun, 25 May 2014 18:07:02 +0000
Subject: [PATCH] dgnc: Use time_after_eq()
Message-Id: <1401041222-18992-1-git-send-email-manuel.schoelling@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>

To be future-proof and for better readability the time comparisons are
modified to use time_after_eq() instead of plain, error-prone math.

Signed-off-by: Manuel Sch=C3=B6lling <manuel.schoelling@gmx.de>
---
 drivers/staging/dgnc/dgnc_neo.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_ne=
o.c
index cf22c7b..a8ca22a 100644
--- a/drivers/staging/dgnc/dgnc_neo.c
+++ b/drivers/staging/dgnc/dgnc_neo.c
@@ -395,7 +395,8 @@ static inline void neo_clear_break(struct channel_t *ch=
, int force)
=20
 	/* Turn break off, and unset some variables */
 	if (ch->ch_flags & CH_BREAK_SENDING) {
-		if ((jiffies >=3D ch->ch_stop_sending_break) || force) {
+		if (time_after_eq(jiffies, ch->ch_stop_sending_break)
+		    || force) {
 			uchar temp =3D readb(&ch->ch_neo_uart->lcr);
 			writeb((temp & ~UART_LCR_SBC), &ch->ch_neo_uart->lcr);
 			neo_pci_posting_flush(ch->ch_bd);
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
