From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 26 Sep 2018 10:57:10 +0000
Subject: [PATCH -next] PCI: hotplug: Remove set but not used variable 'physical_slot'
Message-Id: <1537959962-83251-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <bhelgaas@google.com>, Kees Cook <keescook@chromium.org>, Markus Elfring <elfring@users.sourceforge.net>, Frederick Lawler <fred@fredlawl.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Lukas Wunner <lukas@wunner.de>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/pci/hotplug/cpqphp_core.c: In function 'init_SERR':
drivers/pci/hotplug/cpqphp_core.c:124:5: warning:
 variable 'physical_slot' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pci/hotplug/cpqphp_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pci/hotplug/cpqphp_core.c b/drivers/pci/hotplug/cpqphp_core.c
index 95b7d60..16bbb18 100644
--- a/drivers/pci/hotplug/cpqphp_core.c
+++ b/drivers/pci/hotplug/cpqphp_core.c
@@ -121,7 +121,6 @@ static int init_SERR(struct controller *ctrl)
 {
 	u32 tempdword;
 	u32 number_of_slots;
-	u8 physical_slot;
 
 	if (!ctrl)
 		return 1;
@@ -131,7 +130,6 @@ static int init_SERR(struct controller *ctrl)
 	number_of_slots = readb(ctrl->hpc_reg + SLOT_MASK) & 0x0F;
 	/* Loop through slots */
 	while (number_of_slots) {
-		physical_slot = tempdword;
 		writeb(0, ctrl->hpc_reg + SLOT_SERR);
 		tempdword++;
 		number_of_slots--;
