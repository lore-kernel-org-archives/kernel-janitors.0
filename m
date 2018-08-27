From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Aug 2018 09:24:10 +0000
Subject: [PATCH] staging: pi433: eliminate a temporary variable
Message-Id: <20180827092410.p2ikf5xsa3no7yo5@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We can just get rid of the "spi_address".  It's not clear what the
"address" part of the name means, and the type should have been a u8.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index 085272fb393f..4fa6c0237e59 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -853,7 +853,6 @@ int rf69_write_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)
 #ifdef DEBUG_FIFO_ACCESS
 	int i;
 #endif
-	char spi_address = REG_FIFO | WRITE_BIT;
 	u8 local_buffer[FIFO_SIZE + 1];
 
 	if (size > FIFO_SIZE) {
@@ -862,7 +861,7 @@ int rf69_write_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)
 		return -EMSGSIZE;
 	}
 
-	local_buffer[0] = spi_address;
+	local_buffer[0] = REG_FIFO | WRITE_BIT;
 	memcpy(&local_buffer[1], buffer, size);
 
 #ifdef DEBUG_FIFO_ACCESS
