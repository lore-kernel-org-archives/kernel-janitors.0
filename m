From: Dan Carpenter <error27@gmail.com>
Date: Tue, 10 Aug 2010 05:35:07 +0000
Subject: [patch] Staging: rtl8192su: off by one checks
Message-Id: <20100810053506.GM9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The comparison here should be >= ARRAY_SIZE() instead of >
ARRAY_SIZE().

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/rtl8192su/r8192S_Efuse.c b/drivers/staging/rtl8192su/r8192S_Efuse.c
index bbefd0f..7eaa686 100644
--- a/drivers/staging/rtl8192su/r8192S_Efuse.c
+++ b/drivers/staging/rtl8192su/r8192S_Efuse.c
@@ -1989,9 +1989,8 @@ void efuse_read_data(struct net_device* dev,u8 efuse_read_item,u8 *data,u32 data
 	u8 tmpidx;
 	u8 pg_data[8];
 
-	if(efuse_read_item>  (sizeof(RTL8712_SDIO_EFUSE_TABLE)/sizeof(EFUSE_MAP))){
+	if (efuse_read_item >= ARRAY_SIZE(RTL8712_SDIO_EFUSE_TABLE))
 		return ;
-	}
 
 	offset		= RTL8712_SDIO_EFUSE_TABLE[efuse_read_item].offset ;
 	word_start	= RTL8712_SDIO_EFUSE_TABLE[efuse_read_item].word_start;
@@ -2042,9 +2041,8 @@ void efuse_write_data(struct net_device* dev,u8 efuse_write_item,u8 *data,u32 da
 	u8 tmpidx,tmpbitmask;
 	u8 pg_data[8],tmpbytes=0;
 
-	if(efuse_write_item>  (sizeof(RTL8712_SDIO_EFUSE_TABLE)/sizeof(EFUSE_MAP))){
+	if (efuse_write_item >=  ARRAY_SIZE(RTL8712_SDIO_EFUSE_TABLE))
 		return ;
-	}
 
 	offset		= RTL8712_SDIO_EFUSE_TABLE[efuse_write_item].offset ;
 	word_start	= RTL8712_SDIO_EFUSE_TABLE[efuse_write_item].word_start;
