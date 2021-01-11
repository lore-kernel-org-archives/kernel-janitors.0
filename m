From: Colin King <colin.king@canonical.com>
Date: Mon, 11 Jan 2021 14:46:48 +0000
Subject: [PATCH][next] platform/surface: fix potential integer overflow on shift of a int
Message-Id: <20210111144648.20498-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Mark Gross <mgross@linux.intel.com>, platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The left shift of int 32 bit integer constant 1 is evaluated using 32 bit
arithmetic and then passed as a 64 bit function argument. In the case where
func is 32 or more this can lead to an oveflow.  Avoid this by shifting
using the BIT_ULL macro instead.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: fc00bc8ac1da ("platform/surface: Add Surface ACPI Notify driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/surface/surface_acpi_notify.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface_acpi_notify.c b/drivers/platform/surface/surface_acpi_notify.c
index 8cd67a669c86..ef9c1f8e8336 100644
--- a/drivers/platform/surface/surface_acpi_notify.c
+++ b/drivers/platform/surface/surface_acpi_notify.c
@@ -188,7 +188,7 @@ static int san_acpi_notify_event(struct device *dev, u64 func,
 	union acpi_object *obj;
 	int status = 0;
 
-	if (!acpi_check_dsm(san, &SAN_DSM_UUID, SAN_DSM_REVISION, 1 << func))
+	if (!acpi_check_dsm(san, &SAN_DSM_UUID, SAN_DSM_REVISION, BIT_ULL(func)))
 		return 0;
 
 	dev_dbg(dev, "notify event %#04llx\n", func);
-- 
2.29.2
