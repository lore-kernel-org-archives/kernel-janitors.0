From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Mar 2020 13:45:56 +0000
Subject: [PATCH] PCI: altera: clean up indentation issue on a return statement
Message-Id: <20200327134556.265411-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ley Foon Tan <ley.foon.tan@intel.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Andrew Murray <amurray@thegoodpenguin.co.uk>, Bjorn Helgaas <bhelgaas@google.com>, rfi@lists.rocketboards.org, linux-pci@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A return statment is indented incorrectly, remove extraneous space.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pci/controller/pcie-altera.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-altera.c b/drivers/pci/controller/pcie-altera.c
index b447c3e4abad..24cb1c331058 100644
--- a/drivers/pci/controller/pcie-altera.c
+++ b/drivers/pci/controller/pcie-altera.c
@@ -193,7 +193,7 @@ static bool altera_pcie_valid_device(struct altera_pcie *pcie,
 	if (bus->number = pcie->root_bus_nr && dev > 0)
 		return false;
 
-	 return true;
+	return true;
 }
 
 static int tlp_read_packet(struct altera_pcie *pcie, u32 *value)
-- 
2.25.1
