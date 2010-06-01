From: Dan Carpenter <error27@gmail.com>
Date: Tue, 01 Jun 2010 07:11:27 +0000
Subject: [patch] x86, cacheinfo: dereferences before check
Message-Id: <20100601071126.GF5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Borislav Petkov <borislav.petkov@amd.com>, Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This moves a couple dereferences after the checks in
show_cache_disable() and store_cache_disable().  These were introduced
fairly recently in 9350f982e4: "x86, cacheinfo: Reorganize AMD L3 cache
structure"

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/arch/x86/kernel/cpu/intel_cacheinfo.c b/arch/x86/kernel/cpu/intel_cacheinfo.c
index 33eae20..1725a0e 100644
--- a/arch/x86/kernel/cpu/intel_cacheinfo.c
+++ b/arch/x86/kernel/cpu/intel_cacheinfo.c
@@ -399,12 +399,13 @@ amd_check_l3_disable(int index, struct _cpuid4_info_regs *this_leaf)
 static ssize_t show_cache_disable(struct _cpuid4_info *this_leaf, char *buf,
 				  unsigned int slot)
 {
-	struct pci_dev *dev = this_leaf->l3->dev;
+	struct pci_dev *dev;
 	unsigned int reg = 0;
 
 	if (!this_leaf->l3 || !this_leaf->l3->can_disable)
 		return -EINVAL;
 
+	dev = this_leaf->l3->dev;
 	if (!dev)
 		return -EINVAL;
 
@@ -456,7 +457,7 @@ static ssize_t store_cache_disable(struct _cpuid4_info *this_leaf,
 				   const char *buf, size_t count,
 				   unsigned int slot)
 {
-	struct pci_dev *dev = this_leaf->l3->dev;
+	struct pci_dev *dev;
 	int cpu = cpumask_first(to_cpumask(this_leaf->shared_cpu_map));
 	unsigned long val = 0;
 
@@ -469,6 +470,7 @@ static ssize_t store_cache_disable(struct _cpuid4_info *this_leaf,
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
+	dev = this_leaf->l3->dev;
 	if (!dev)
 		return -EINVAL;
 
