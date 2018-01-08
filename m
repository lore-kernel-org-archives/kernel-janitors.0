From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 Jan 2018 17:09:36 +0000
Subject: [PATCH] misc/lattice-ecp3-config: Delete an error message for a failed memory allocation in two func
Message-Id: <293c6ae3-7b1e-690c-7ac0-352dee270e32@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 Jan 2018 18:01:39 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/lattice-ecp3-config.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/lattice-ecp3-config.c b/drivers/misc/lattice-ecp3-config.c
index 626fdcaf2510..8aa60907ced4 100644
--- a/drivers/misc/lattice-ecp3-config.c
+++ b/drivers/misc/lattice-ecp3-config.c
@@ -119,10 +119,8 @@ static void firmware_load(const struct firmware *fw, void *context)
 	dev_dbg(&spi->dev, "FPGA Status=%08x\n", status);
 
 	buffer = kzalloc(fw->size + 8, GFP_KERNEL);
-	if (!buffer) {
-		dev_err(&spi->dev, "Error: Can't allocate memory!\n");
+	if (!buffer)
 		return;
-	}
 
 	/*
 	 * Insert WRITE_INC command into stream (one SPI frame)
@@ -196,10 +194,9 @@ static int lattice_ecp3_probe(struct spi_device *spi)
 	int err;
 
 	data = devm_kzalloc(&spi->dev, sizeof(*data), GFP_KERNEL);
-	if (!data) {
-		dev_err(&spi->dev, "Memory allocation for fpga_data failed\n");
+	if (!data)
 		return -ENOMEM;
-	}
+
 	spi_set_drvdata(spi, data);
 
 	init_completion(&data->fw_loaded);
-- 
2.15.1

