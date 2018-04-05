From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Apr 2018 11:23:11 +0000
Subject: [PATCH] rsi: Free the unaligned pointer
Message-Id: <20180405112311.GD4218@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Amitkumar Karwar <amit.karwar@redpinesignals.com>
Cc: Prameela Rani Garnepudi <prameela.j04cs@gmail.com>, Karun Eagalapati <karun256@gmail.com>, Siva Rebbagondla <siva.rebbagondla@redpinesignals.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The problem here is that we allocate "data".  Then we do
"data = PTR_ALIGN(data, 8);" and then we free the aligned pointer and
not the one we allocated.

I don't know if it causes an issue in real life, but it seems like a
reasonable thing to free the same pointer that we allocated.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/rsi/rsi_91x_sdio.c b/drivers/net/wireless/rsi/rsi_91x_sdio.c
index d76e69c0beaa..ca4e698ab69b 100644
--- a/drivers/net/wireless/rsi/rsi_91x_sdio.c
+++ b/drivers/net/wireless/rsi/rsi_91x_sdio.c
@@ -652,11 +652,11 @@ static int rsi_sdio_load_data_master_write(struct rsi_hw *adapter,
 static int rsi_sdio_master_reg_read(struct rsi_hw *adapter, u32 addr,
 				    u32 *read_buf, u16 size)
 {
-	u32 addr_on_bus, *data;
+	u32 addr_on_bus, *data, *data_orig;
 	u16 ms_addr;
 	int status;
 
-	data = kzalloc(RSI_MASTER_REG_BUF_SIZE, GFP_KERNEL);
+	data = data_orig = kzalloc(RSI_MASTER_REG_BUF_SIZE, GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
@@ -709,7 +709,7 @@ static int rsi_sdio_master_reg_read(struct rsi_hw *adapter, u32 addr,
 	}
 
 err:
-	kfree(data);
+	kfree(data_orig);
 	return status;
 }
 
@@ -717,10 +717,10 @@ static int rsi_sdio_master_reg_write(struct rsi_hw *adapter,
 				     unsigned long addr,
 				     unsigned long data, u16 size)
 {
-	unsigned long *data_aligned;
+	unsigned long *data_aligned, *data_orig;
 	int status;
 
-	data_aligned = kzalloc(RSI_MASTER_REG_BUF_SIZE, GFP_KERNEL);
+	data_aligned = data_orig = kzalloc(RSI_MASTER_REG_BUF_SIZE, GFP_KERNEL);
 	if (!data_aligned)
 		return -ENOMEM;
 
@@ -743,7 +743,7 @@ static int rsi_sdio_master_reg_write(struct rsi_hw *adapter,
 		rsi_dbg(ERR_ZONE,
 			"%s: Unable to set ms word to common reg\n",
 			__func__);
-		kfree(data_aligned);
+		kfree(data_orig);
 		return -EIO;
 	}
 	addr = addr & 0xFFFF;
@@ -757,7 +757,7 @@ static int rsi_sdio_master_reg_write(struct rsi_hw *adapter,
 		rsi_dbg(ERR_ZONE,
 			"%s: Unable to do AHB reg write\n", __func__);
 
-	kfree(data_aligned);
+	kfree(data_orig);
 	return status;
 }
 
