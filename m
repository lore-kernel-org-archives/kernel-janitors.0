From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Wed, 11 Apr 2007 15:40:46 +0000
Subject: [KJ] [PATCH] SPIN_LOCK_UNLOCKED cleanup in
Message-Id: <20070411152846.GA11449@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070411153857.GA19968@devserv.devel.redhat.com>
In-Reply-To: <20070411153857.GA19968@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, alan@redhat.com

remove SPIN_LOCK_UNLOCKED, use DEFINE_SPINLOCK instead

Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>

---
 pata_winbond.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)


diff --git a/drivers/ata/pata_winbond.c b/drivers/ata/pata_winbond.c
index 6c11103..cfcd2a5 100644
--- a/drivers/ata/pata_winbond.c
+++ b/drivers/ata/pata_winbond.c
@@ -36,7 +36,7 @@ static int probe_winbond = 1;
 static int probe_winbond;
 #endif
 
-static spinlock_t winbond_lock = SPIN_LOCK_UNLOCKED;
+static DEFINE_SPINLOCK(winbond_lock);
 
 static void winbond_writecfg(unsigned long port, u8 reg, u8 val)
 {

-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
