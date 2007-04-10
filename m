From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Date: Tue, 10 Apr 2007 20:50:28 +0000
Subject: Re: [KJ] remove SPIN_LOCK_UNLOCKED
Message-Id: <Pine.LNX.4.61.0704102249290.32056@yvahk01.tjqt.qr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070410181654.GA10525@arun.site>
In-Reply-To: <20070410181654.GA10525@arun.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Milind Arun Choudhary <milindchoudhary@gmail.com>
Cc: kernel-janitors@lists.osdl.org, kernelnewbies@nl.linux.org, linux-kernel@vger.kernel.org


On Apr 10 2007 23:46, Milind Arun Choudhary wrote:

>"use spin_lock_init instead of SPIN_LOCK_UNLOCKED"

Fact is, we cannot remove SPIN_LOCK_UNLOCKED. It's needed for
variables outside functions:

static spinlock_t foobar = SPIN_LOCK_UNLOCKED;




>let me know if this is fine ..

not for me to comment :)


> aerdrv.c |    2 +-
> 1 files changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/pci/pcie/aer/aerdrv.c b/drivers/pci/pcie/aer/aerdrv.c
>index db6ad8e..6846fb4 100644
>--- a/drivers/pci/pcie/aer/aerdrv.c
>+++ b/drivers/pci/pcie/aer/aerdrv.c
>@@ -157,7 +157,7 @@ static struct aer_rpc* aer_alloc_rpc(struct pcie_device *dev)
> 	 * Initialize Root lock access, e_lock, to Root Error Status Reg,
> 	 * Root Error ID Reg, and Root error producer/consumer index.
> 	 */
>-	rpc->e_lock = SPIN_LOCK_UNLOCKED;
>+	spin_lock_init(&rpc->e_lock);
> 
> 	rpc->rpd = dev;
> 	INIT_WORK(&rpc->dpc_handler, aer_isr);
>
>
>-- 
>Milind Arun Choudhary
>-
>To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>Please read the FAQ at  http://www.tux.org/lkml/
>

Jan
-- 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
