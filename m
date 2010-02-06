From: Julia Lawall <julia@diku.dk>
Date: Sat, 06 Feb 2010 08:42:39 +0000
Subject: [PATCH 3/11] arch/x86/kernel: Correct NULL test
Message-Id: <Pine.LNX.4.64.1002060942170.8092@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joerg.roedel@amd.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

dev was tested just above, so drop the second test.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r@
expression *x;
expression e;
identifier l;
@@

if (x = NULL || ...) {
    ... when forall
    return ...; }
... when != goto l;
    when != x = e
    when != &x
*x = NULL
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/x86/kernel/amd_iommu.c         |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/amd_iommu.c b/arch/x86/kernel/amd_iommu.c
index adb0ba0..2c4a501 100644
--- a/arch/x86/kernel/amd_iommu.c
+++ b/arch/x86/kernel/amd_iommu.c
@@ -118,7 +118,7 @@ static bool check_device(struct device *dev)
 		return false;
 
 	/* No device or no PCI device */
-	if (!dev || dev->bus != &pci_bus_type)
+	if (dev->bus != &pci_bus_type)
 		return false;
 
 	devid = get_device_id(dev);
