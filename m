From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Tue, 10 Apr 2007 18:28:54 +0000
Subject: [KJ] remove SPIN_LOCK_UNLOCKED
Message-Id: <20070410181654.GA10525@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: kernelnewbies@nl.linux.org, linux-kernel@vger.kernel.org

"use spin_lock_init instead of SPIN_LOCK_UNLOCKED"


i'm a bit confused with SPIN_LOCK_UNLOCKED removal
 I just did the below mentioned change
but then came to know that  spin_lock_init is defined as

# define spin_lock_init(lock)                                   \
        do { *(lock) = SPIN_LOCK_UNLOCKED; } while (0)

so what difference does it make..
eventually replacing SPIN_LOCK_UNLOCKED with itself

or is it just that this one [SPIN_LOCK_UNLOCKED] also needs 
to be replaced with __SPIN_LOCK_UNLOCKED?

after thought with CONFIG_DEBUG_SPINLOCK does make a diff


let me know if this is fine ..


 aerdrv.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer/aerdrv.c b/drivers/pci/pcie/aer/aerdrv.c
index db6ad8e..6846fb4 100644
--- a/drivers/pci/pcie/aer/aerdrv.c
+++ b/drivers/pci/pcie/aer/aerdrv.c
@@ -157,7 +157,7 @@ static struct aer_rpc* aer_alloc_rpc(struct pcie_device *dev)
 	 * Initialize Root lock access, e_lock, to Root Error Status Reg,
 	 * Root Error ID Reg, and Root error producer/consumer index.
 	 */
-	rpc->e_lock = SPIN_LOCK_UNLOCKED;
+	spin_lock_init(&rpc->e_lock);
 
 	rpc->rpd = dev;
 	INIT_WORK(&rpc->dpc_handler, aer_isr);


-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
