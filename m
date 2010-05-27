From: "Roedel, Joerg" <Joerg.Roedel@amd.com>
Date: Thu, 27 May 2010 11:06:09 +0000
Subject: Re: [PATCH 6/17] arch/x86/kernel: Add missing spin_unlock
Message-Id: <20100527110608.GU3266@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005261755260.23743@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005261755260.23743@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, May 26, 2010 at 11:55:59AM -0400, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Add a spin_unlock missing on the error path.  The locks and unlocks are
> balanced in other functions, so it seems that the same should be the case
> here.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)

Applied the attached version of the patch. Thanks for catching this.

	Joerg

From 84fe6c19e4a598e8071e3bd1b2c923454eae1268 Mon Sep 17 00:00:00 2001
From: Julia Lawall <julia@diku.dk>
Date: Thu, 27 May 2010 12:31:51 +0200
Subject: [PATCH] arch/x86/kernel: Add missing spin_unlock

Add a spin_unlock missing on the error path.  The locks and unlocks are
balanced in other functions, so it seems that the same should be the case
here.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression E1;
@@

* spin_lock(E1,...);
  <+... when != E1
  if (...) {
    ... when != E1
*   return ...;
  }
  ...+>
* spin_unlock(E1,...);
// </smpl>

Cc: stable@kernel.org
Signed-off-by: Julia Lawall <julia@diku.dk>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/kernel/amd_iommu.c |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/amd_iommu.c b/arch/x86/kernel/amd_iommu.c
index fa5a147..8a9aaa8 100644
--- a/arch/x86/kernel/amd_iommu.c
+++ b/arch/x86/kernel/amd_iommu.c
@@ -1487,6 +1487,7 @@ static int __attach_device(struct device *dev,
 			   struct protection_domain *domain)
 {
 	struct iommu_dev_data *dev_data, *alias_data;
+	int ret;
 
 	dev_data   = get_dev_data(dev);
 	alias_data = get_dev_data(dev_data->alias);
@@ -1498,13 +1499,14 @@ static int __attach_device(struct device *dev,
 	spin_lock(&domain->lock);
 
 	/* Some sanity checks */
+	ret = -EBUSY;
 	if (alias_data->domain != NULL &&
 	    alias_data->domain != domain)
-		return -EBUSY;
+		goto out_unlock;
 
 	if (dev_data->domain != NULL &&
 	    dev_data->domain != domain)
-		return -EBUSY;
+		goto out_unlock;
 
 	/* Do real assignment */
 	if (dev_data->alias != dev) {
@@ -1520,10 +1522,14 @@ static int __attach_device(struct device *dev,
 
 	atomic_inc(&dev_data->bind);
 
+	ret = 0;
+
+out_unlock:
+
 	/* ready */
 	spin_unlock(&domain->lock);
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
1.7.1


