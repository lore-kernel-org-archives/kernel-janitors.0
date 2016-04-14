From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Apr 2016 09:33:37 +0000
Subject: [patch] firmware: qemu_fw_cfg.c: potential unintialized variable
Message-Id: <20160414093337.GD16549@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gabriel Somlo <somlo@cmu.edu>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It acpi_acquire_global_lock() return AE_NOT_CONFIGURED then "glk" isn't
initialized, which, if you got very unlucky, could cause a bug.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index d999fe3..0e20116 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -77,7 +77,7 @@ static inline u16 fw_cfg_sel_endianness(u16 key)
 static inline void fw_cfg_read_blob(u16 key,
 				    void *buf, loff_t pos, size_t count)
 {
-	u32 glk;
+	u32 glk = -1U;
 	acpi_status status;
 
 	/* If we have ACPI, ensure mutual exclusion against any potential
