From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 30 Jun 2012 12:07:55 +0000
Subject: [patch] wlcore: fix a couple small memory leaks
Message-Id: <20120630120755.GC22767@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luciano Coelho <coelho@ti.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, Arik Nemtsov <arik@wizery.com>, Eliad Peller <eliad@wizery.com>, Ido Yariv <ido@wizery.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We should free "chunk" here before returning the error code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/ti/wlcore/boot.c b/drivers/net/wireless/ti/wlcore/boot.c
index 8965960..48b2fee 100644
--- a/drivers/net/wireless/ti/wlcore/boot.c
+++ b/drivers/net/wireless/ti/wlcore/boot.c
@@ -141,7 +141,7 @@ static int wl1271_boot_upload_firmware_chunk(struct wl1271 *wl, void *buf,
 	partition.mem.start = dest;
 	ret = wlcore_set_partition(wl, &partition);
 	if (ret < 0)
-		return ret;
+		goto out;
 
 	/* 10.1 set partition limit and chunk num */
 	chunk_num = 0;
@@ -157,7 +157,7 @@ static int wl1271_boot_upload_firmware_chunk(struct wl1271 *wl, void *buf,
 			partition.mem.start = addr;
 			ret = wlcore_set_partition(wl, &partition);
 			if (ret < 0)
-				return ret;
+				goto out;
 		}
 
 		/* 10.3 upload the chunk */
