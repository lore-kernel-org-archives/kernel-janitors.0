From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 May 2017 17:50:05 +0000
Subject: [PATCH 3/4] ueagle-atm: Delete unnecessary return statements in two functions
Message-Id: <82bfa764-34d9-3150-6503-00079b27cd54@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d1c7c5d1-68b8-bbfc-8d0b-71a8e6cdd152@users.sourceforge.net>
In-Reply-To: <d1c7c5d1-68b8-bbfc-8d0b-71a8e6cdd152@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthieu Castet <castet.matthieu@free.fr>, Stanislaw Gruszka <stf_xl@wp.pl>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 May 2017 19:22:12 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: void function return statements are not generally useful

Thus remove such a statement in the affected functions.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/atm/ueagle-atm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index 9725e6f2f301..0ca4ff3e6683 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -1058,7 +1058,6 @@ static void __uea_load_page_e4(struct uea_softc *sc, u8 pageno, int boot)
 
 bad:
 	uea_err(INS_TO_USBDEV(sc), "sending DSP block %u failed\n", blockno);
-	return;
 }
 
 static void uea_load_page_e4(struct work_struct *work)
@@ -2101,7 +2100,6 @@ static void uea_dispatch_cmv_e4(struct uea_softc *sc, struct intr_pkt *intr)
 			E4_FUNCTION_TYPE(cmv->wFunction),
 			E4_FUNCTION_SUBTYPE(cmv->wFunction));
 	uea_leaves(INS_TO_USBDEV(sc));
-	return;
 }
 
 static void uea_schedule_load_page_e1(struct uea_softc *sc,
-- 
2.13.0

