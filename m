From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 11 Dec 2008 21:36:00 +0000
Subject: [PATCH 4/9][v2] mISDN: un-export symbol 'plx_lock'
Message-Id: <49419a2d.06a1660a.5c0a.ffff908c@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: Karsten Keil <kkeil@suse.de>

'plx_lock' is only used within hfcmulti.c.

Fix this warning:

  drivers/isdn/hardware/mISDN/hfcmulti.c:176:1: warning: symbol 'plx_lock' shadows an earlier one
  drivers/isdn/hardware/mISDN/hfcmulti.c:175:19: originally declared here

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
Acked-by: Karsten Keil <kkeil@suse.de>
---
 drivers/isdn/hardware/mISDN/hfcmulti.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/isdn/hardware/mISDN/hfcmulti.c b/drivers/isdn/hardware/mISDN/hfcmulti.c
index 599d832..970201d 100644
--- a/drivers/isdn/hardware/mISDN/hfcmulti.c
+++ b/drivers/isdn/hardware/mISDN/hfcmulti.c
@@ -173,7 +173,6 @@ static int interrupt_registered;
 static struct hfc_multi *syncmaster;
 static int plxsd_master; /* if we have a master card (yet) */
 static spinlock_t plx_lock; /* may not acquire other lock inside */
-EXPORT_SYMBOL(plx_lock);
 
 #define	TYP_E1		1
 #define	TYP_4S		4
-- 
1.5.6.3

