From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Nov 2020 07:22:51 +0000
Subject: [PATCH] platform/x86: pmt: Fix a potential Oops on error in probe
Message-Id: <20201117072251.GC1111239@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David E. Box" <david.e.box@linux.intel.com>, Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mark Gross <mgross@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

The "ns->attr_grp" pointer can be NULL so this error handling code needs
to check for that to avoid an Oops.

Fixes: e2729113ce66 ("platform/x86: Intel PMT class driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/platform/x86/intel_pmt_class.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmt_class.c b/drivers/platform/x86/intel_pmt_class.c
index aa88dc23bbde..c8939fba4509 100644
--- a/drivers/platform/x86/intel_pmt_class.c
+++ b/drivers/platform/x86/intel_pmt_class.c
@@ -225,7 +225,8 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 		return 0;
 
 fail_ioremap:
-	sysfs_remove_group(entry->kobj, ns->attr_grp);
+	if (ns->attr_grp)
+		sysfs_remove_group(entry->kobj, ns->attr_grp);
 fail_sysfs:
 	device_unregister(dev);
 fail_dev_create:
-- 
2.28.0
