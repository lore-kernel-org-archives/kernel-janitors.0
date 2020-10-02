From: Colin King <colin.king@canonical.com>
Date: Fri, 02 Oct 2020 16:23:18 +0000
Subject: [PATCH][next] PCI/ASPM: fix an unintended sign extension of a u16
Message-Id: <20201002162318.93555-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <bhelgaas@google.com>, Puranjay Mohan <puranjay12@gmail.com>, linux-pci@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The multiplication of the u16 variable 'value' causes it to be
prompted to a int type and this is then sign extended to a u64.
When the result of the multiplication is > 0x7fffffff the upper
bits are all unitentionally set to 1 on a sign extension operation.
Fix this by explicitly casting value to a u64 to avoid the int
type promotion and the following sign extension.

Addresses-Coverity: ("Unintended sign extension")
Fixes: 5ccf2a6e483f ("PCI/ASPM: Add support for LTR _DSM")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pci/pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index db8feb2033e7..736197f9094b 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3083,8 +3083,8 @@ static u64 pci_ltr_decode(u16 latency)
 	case 1: return value * 32;
 	case 2: return value * 1024;
 	case 3: return value * 32768;
-	case 4: return value * 1048576;
-	case 5: return value * 33554432;
+	case 4: return (uint64_t)value * 1048576;
+	case 5: return (uint64_t)value * 33554432;
 	}
 	return 0;
 }
-- 
2.27.0
