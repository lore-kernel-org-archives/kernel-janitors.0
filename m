From: Hannes Eder <hannes@hanneseder.net>
Date: Wed, 10 Dec 2008 15:13:44 +0000
Subject: [PATCH 4/9] mISDN: fix sparse warnings
Message-Id: <493feab4.0aaa660a.7938.3213@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <kkeil@suse.de>
Cc: linux-kernel@vger.kernel.org

Impact: make an exported symbol non static

Fix this warning:

  drivers/isdn/hardware/mISDN/hfcmulti.c:176:1: warning: symbol 'plx_lock' shadows an earlier one
  drivers/isdn/hardware/mISDN/hfcmulti.c:175:19: originally declared here

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---

Note that patch introduces this new warning:

  drivers/isdn/hardware/mISDN/hfcmulti.c:175:12: warning: symbol 'plx_lock' was not declared. Should it be static?

Should 'plx_lock' be declared in a header file?  Or is it really
neccessart to export it?


 drivers/isdn/hardware/mISDN/hfcmulti.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/isdn/hardware/mISDN/hfcmulti.c b/drivers/isdn/hardware/mISDN/hfcmulti.c
index 599d832..b4595f7 100644
--- a/drivers/isdn/hardware/mISDN/hfcmulti.c
+++ b/drivers/isdn/hardware/mISDN/hfcmulti.c
@@ -172,7 +172,7 @@ static int interrupt_registered;
 
 static struct hfc_multi *syncmaster;
 static int plxsd_master; /* if we have a master card (yet) */
-static spinlock_t plx_lock; /* may not acquire other lock inside */
+spinlock_t plx_lock; /* may not acquire other lock inside */
 EXPORT_SYMBOL(plx_lock);
 
 #define	TYP_E1		1
-- 
1.5.6.3

