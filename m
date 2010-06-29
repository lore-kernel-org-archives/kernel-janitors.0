From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 29 Jun 2010 10:15:28 +0000
Subject: [PATCH 09/25] pci-sysfs: remove casts from void*
Message-Id: <1277806529-31010-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, Greg Kroah-Hartman <gregkh@suse.de>, Chris Wright <chrisw@sous-sol.org>, "Michael S. Tsirkin" <mst@redhat.com>, Michal Schmidt <mschmidt@redhat.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/pci/pci-sysfs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index afd2fbf..7f8bc8c 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -734,7 +734,7 @@ pci_mmap_resource(struct kobject *kobj, struct bin_attribute *attr,
 {
 	struct pci_dev *pdev = to_pci_dev(container_of(kobj,
 						       struct device, kobj));
-	struct resource *res = (struct resource *)attr->private;
+	struct resource *res = attr->private;
 	enum pci_mmap_state mmap_type;
 	resource_size_t start, end;
 	int i;
-- 
1.7.0.4

