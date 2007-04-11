From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Wed, 11 Apr 2007 17:55:26 +0000
Subject: [KJ] [PATCH]SPIN_LOCK_UNLOCKED cleanup in
Message-Id: <20070411175434.GA9110@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: linux1394-devel@lists.sourceforge.net, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, bcollins@debian.org, stefanr@s5r6.in-berlin.de

SPIN_LOCK_UNLOCKED cleanup,use DEFINE_SPINLOCK instead 

Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>
---

 ieee1394_transactions.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ieee1394/ieee1394_transactions.c b/drivers/ieee1394/ieee1394_transactions.c
index 0833fc9..8563077 100644
--- a/drivers/ieee1394/ieee1394_transactions.c
+++ b/drivers/ieee1394/ieee1394_transactions.c
@@ -32,7 +32,7 @@
 #ifndef HPSB_DEBUG_TLABELS
 static
 #endif
-spinlock_t hpsb_tlabel_lock = SPIN_LOCK_UNLOCKED;
+DEFINE_SPINLOCK(hpsb_tlabel_lock);
 
 static DECLARE_WAIT_QUEUE_HEAD(tlabel_wq);
 
-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
