From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 16 Jun 2020 09:27:28 +0000
Subject: [PATCH] media: atomisp: Fix a pointer math problem in dump_sp_dmem()
Message-Id: <20200616092728.GB11940@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org

The "io_virt_addr" variable is a u32 pointer and it should be
incremented by one instead of four.  The current code will dump bogus
data and read beyond the end of the buffer.

Fixes: 69a03e36c711 ("media: atomisp: get rid of an iomem abstraction layer")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 7b936e5a5f03..6faf223c6d20 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -682,7 +682,7 @@ void dump_sp_dmem(struct atomisp_device *isp, unsigned int addr,
 	do {
 		data = *io_virt_addr;
 		dev_dbg(isp->dev, "%s, \t [0x%x]:0x%x\n", __func__, addr, data);
-		io_virt_addr += sizeof(u32);
+		io_virt_addr++;
 		size32 -= 1;
 	} while (size32 > 0);
 }
-- 
2.27.0
