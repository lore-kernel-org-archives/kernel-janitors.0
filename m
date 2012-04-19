From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 19 Apr 2012 07:00:53 +0000
Subject: [patch] cpu: remove some dead code in store_cache_disable()
Message-Id: <20120419070053.GB16645@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Frank Arnold <frank.arnold@amd.com>, Borislav Petkov <borislav.petkov@amd.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

amd_set_l3_disable_slot() never returns -EEXIST, it only returns -EINVAL
or zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/kernel/cpu/intel_cacheinfo.c b/arch/x86/kernel/cpu/intel_cacheinfo.c
index 73d08ed..7b4e294 100644
--- a/arch/x86/kernel/cpu/intel_cacheinfo.c
+++ b/arch/x86/kernel/cpu/intel_cacheinfo.c
@@ -466,12 +466,9 @@ static ssize_t store_cache_disable(struct _cpuid4_info *this_leaf,
 		return -EINVAL;
 
 	err = amd_set_l3_disable_slot(this_leaf->base.nb, cpu, slot, val);
-	if (err) {
-		if (err = -EEXIST)
-			printk(KERN_WARNING "L3 disable slot %d in use!\n",
-					    slot);
+	if (err)
 		return err;
-	}
+
 	return count;
 }
 
