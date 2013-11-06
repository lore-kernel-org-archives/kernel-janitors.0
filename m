From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Nov 2013 07:41:28 +0000
Subject: [patch] wcn36xx: harmless memory corruption bug in debugfs
Message-Id: <20131106074128.GA13475@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eugene Krasnikov <k.eugene.e@gmail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On 64 bit systems we write past the end of the arg[] array.

Fixes: 8e84c2582169 ('wcn36xx: mac80211 driver for Qualcomm WCN3660/WCN3680 hardware')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/ath/wcn36xx/debug.c b/drivers/net/wireless/ath/wcn36xx/debug.c
index 5b84f7a..ef44a2da 100644
--- a/drivers/net/wireless/ath/wcn36xx/debug.c
+++ b/drivers/net/wireless/ath/wcn36xx/debug.c
@@ -126,7 +126,7 @@ static ssize_t write_file_dump(struct file *file,
 		if (begin = NULL)
 			break;
 
-		if (kstrtoul(begin, 0, (unsigned long *)(arg + i)) != 0)
+		if (kstrtou32(begin, 0, &arg[i]) != 0)
 			break;
 	}
 
