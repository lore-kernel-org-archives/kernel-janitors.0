From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 29 Nov 2015 22:02:49 +0000
Subject: [PATCH 1/3] xen/gntdev: constify mmu_notifier_ops structures
Message-Id: <1448834571-2988-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1448834571-2988-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1448834571-2988-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Vrabel <david.vrabel@citrix.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org

This mmu_notifier_ops structure is never modified, so declare it as
const, like the other mmu_notifier_ops structures.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The patches in this series are independent of each other.

 drivers/xen/gntdev.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 2ea0b3b..a27a9a5 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -518,7 +518,7 @@ static void mn_release(struct mmu_notifier *mn,
 	mutex_unlock(&priv->lock);
 }
 
-static struct mmu_notifier_ops gntdev_mmu_ops = {
+static const struct mmu_notifier_ops gntdev_mmu_ops = {
 	.release                = mn_release,
 	.invalidate_page        = mn_invl_page,
 	.invalidate_range_start = mn_invl_range_start,

