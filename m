From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 31 Aug 2019 06:58:38 +0000
Subject: [PATCH -next] PCI: Use GFP_ATOMIC under spin lock
Message-Id: <20190831070147.25607-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

A spin lock is taken here so we should use GFP_ATOMIC.

Fixes: 41b5ef225daa ("PCI: Clean up resource_alignment parameter to not require static buffer")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/pci/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 484e35349565..0b5fc6736f3f 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6148,7 +6148,7 @@ static ssize_t resource_alignment_store(struct bus_type *bus,
 	spin_lock(&resource_alignment_lock);
 
 	kfree(resource_alignment_param);
-	resource_alignment_param = kstrndup(buf, count, GFP_KERNEL);
+	resource_alignment_param = kstrndup(buf, count, GFP_ATOMIC);
 
 	spin_unlock(&resource_alignment_lock);
