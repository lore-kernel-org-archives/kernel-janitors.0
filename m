From: Colin King <colin.king@canonical.com>
Date: Mon, 09 Oct 2017 17:26:55 +0000
Subject: [PATCH] perf/x86/intel/uncore: fix memory leaks on allocation failures
Message-Id: <20171009172655.6132-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently if an allocation fails then the error return paths
don't free up any currently allocated pmus[].boxes and pmus causing
a memory leak.  Add an error clean up exit path that frees these
objects.

Detected by CoverityScan, CID#711632 ("Resource Leak")

Fixes: 087bfbb03269 ("perf/x86: Add generic Intel uncore PMU support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/events/intel/uncore.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/x86/events/intel/uncore.c b/arch/x86/events/intel/uncore.c
index 1c5390f1cf09..123685a54b2a 100644
--- a/arch/x86/events/intel/uncore.c
+++ b/arch/x86/events/intel/uncore.c
@@ -822,7 +822,7 @@ static int __init uncore_type_init(struct intel_uncore_type *type, bool setid)
 		pmus[i].type	= type;
 		pmus[i].boxes	= kzalloc(size, GFP_KERNEL);
 		if (!pmus[i].boxes)
-			return -ENOMEM;
+			goto err;
 	}
 
 	type->pmus = pmus;
@@ -836,7 +836,7 @@ static int __init uncore_type_init(struct intel_uncore_type *type, bool setid)
 		attr_group = kzalloc(sizeof(struct attribute *) * (i + 1) +
 					sizeof(*attr_group), GFP_KERNEL);
 		if (!attr_group)
-			return -ENOMEM;
+			goto err;
 
 		attrs = (struct attribute **)(attr_group + 1);
 		attr_group->name = "events";
@@ -850,6 +850,12 @@ static int __init uncore_type_init(struct intel_uncore_type *type, bool setid)
 
 	type->pmu_group = &uncore_pmu_attr_group;
 	return 0;
+
+err:
+	for (i = 0; i < type->num_boxes; i++)
+		kfree(pmus[i].boxes);
+	kfree(pmus);
+	return -ENOMEM;
 }
 
 static int __init
-- 
2.14.1

