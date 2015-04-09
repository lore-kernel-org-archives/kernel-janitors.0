From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Apr 2015 09:08:05 +0000
Subject: [patch] perf/x86/intel/pt: cleanup error handling in pt_pmu_hw_init()
Message-Id: <20150409090805.GG17605@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is no need to free NULL pointers.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/kernel/cpu/perf_event_intel_pt.c b/arch/x86/kernel/cpu/perf_event_intel_pt.c
index f5a3afc..c358877 100644
--- a/arch/x86/kernel/cpu/perf_event_intel_pt.c
+++ b/arch/x86/kernel/cpu/perf_event_intel_pt.c
@@ -135,12 +135,12 @@ static int __init pt_pmu_hw_init(void)
 	size = sizeof(struct attribute *) * (ARRAY_SIZE(pt_caps) + 1);
 	attrs = kzalloc(size, GFP_KERNEL);
 	if (!attrs)
-		goto err_attrs;
+		return -ENOMEM;
 
 	size = sizeof(struct dev_ext_attribute) * (ARRAY_SIZE(pt_caps) + 1);
 	de_attrs = kzalloc(size, GFP_KERNEL);
 	if (!de_attrs)
-		goto err_de_attrs;
+		goto err_attrs;
 
 	for (i = 0; i < ARRAY_SIZE(pt_caps); i++) {
 		de_attrs[i].attr.attr.name = pt_caps[i].name;
@@ -155,8 +155,6 @@ static int __init pt_pmu_hw_init(void)
 	pt_cap_group.attrs = attrs;
 	return 0;
 
-err_de_attrs:
-	kfree(de_attrs);
 err_attrs:
 	kfree(attrs);
 
