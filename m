From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 31 Aug 2019 12:49:32 +0000
Subject: [PATCH -next] PCI: Use GFP_ATOMIC in resource_alignment_store()
Message-Id: <20190831124932.18759-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

When allocating memory, the GFP_KERNEL cannot be used during the
spin_lock period. It may cause scheduling when holding spin_lock.

Fixes: f13755318675 ("PCI: Move pci_[get|set]_resource_alignment_param() into their callers")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
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
