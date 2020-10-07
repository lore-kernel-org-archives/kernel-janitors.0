From: Colin King <colin.king@canonical.com>
Date: Wed, 07 Oct 2020 11:46:15 +0000
Subject: [PATCH] PCI: fix a potential uninitentional integer overflow issue
Message-Id: <20201007114615.19966-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Stephen Bates <sbates@raithlin.com>, Logan Gunthorpe <logang@deltatee.com>, Alex Williamson <alex.williamson@redhat.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The shift of 1 by align_order is evaluated using 32 bit arithmetic
and the result is assigned to a resource_size_t type variable that
is a 64 bit unsigned integer on 64 bit platforms. Fix an overflow
before widening issue by using the BIT_ULL macro to perform the
shift.

Addresses-Coverity: ("Uninitentional integer overflow")
Fixes: 07d8d7e57c28 ("PCI: Make specifying PCI devices in kernel parameters reusable")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pci/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 6d4d5a2f923d..1a5844d7af35 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6209,7 +6209,7 @@ static resource_size_t pci_specified_resource_alignment(struct pci_dev *dev,
 			if (align_order = -1)
 				align = PAGE_SIZE;
 			else
-				align = 1 << align_order;
+				align = BIT_ULL(align_order);
 			break;
 		} else if (ret < 0) {
 			pr_err("PCI: Can't parse resource_alignment parameter: %s\n",
-- 
2.27.0
