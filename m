From: Colin King <colin.king@canonical.com>
Date: Tue, 10 Nov 2020 22:10:48 +0000
Subject: [PATCH][V2] PCI: Fix a potential uninitentional integer overflow issue
Message-Id: <20201110221048.3411288-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <bhelgaas@google.com>, Stephen Bates <sbates@raithlin.com>, Alex Williamson <alex.williamson@redhat.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Logan Gunthorpe <logang@deltatee.com>, linux-pci@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The shift of 1 by align_order is evaluated using 32 bit arithmetic
and the result is assigned to a resource_size_t type variable that
is a 64 bit unsigned integer on 64 bit platforms. Fix an overflow
before widening issue by making the 1 a ULL.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: 07d8d7e57c28 ("PCI: Make specifying PCI devices in kernel parameters reusable")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: Use ULL instead of BIT_ULL(), fix spelling mistake and capitalize first
    word of patch subject.

---
 drivers/pci/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 3ef63a101fa1..248044a7ef8c 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6214,7 +6214,7 @@ static resource_size_t pci_specified_resource_alignment(struct pci_dev *dev,
 			if (align_order = -1)
 				align = PAGE_SIZE;
 			else
-				align = 1 << align_order;
+				align = 1ULL << align_order;
 			break;
 		} else if (ret < 0) {
 			pr_err("PCI: Can't parse resource_alignment parameter: %s\n",
-- 
2.28.0
