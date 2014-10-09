From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Oct 2014 09:59:39 +0000
Subject: [patch 2/2] ipw2x00: clean up a condition
Message-Id: <20141009095939.GB20875@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanislav Yakovlev <stas.yakovlev@gmail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The original condition was "(PAGE_SIZE - len)" when "(len < PAGE_SIZE)"
is intended.

This condition is not really sufficient, but also not really needed...
If "len > PAGE_SIZE" then it we will print a warning message in dmesg
but there are no other effects.  Maybe we should just remove the
condition?

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/ipw2x00/ipw2200.c b/drivers/net/wireless/ipw2x00/ipw2200.c
index edc3443..67cad9b 100644
--- a/drivers/net/wireless/ipw2x00/ipw2200.c
+++ b/drivers/net/wireless/ipw2x00/ipw2200.c
@@ -1363,7 +1363,7 @@ static ssize_t show_cmd_log(struct device *d,
 	if (!priv->cmdlog)
 		return 0;
 	for (i = (priv->cmdlog_pos + 1) % priv->cmdlog_len;
-	     (i != priv->cmdlog_pos) && (PAGE_SIZE - len);
+	     (i != priv->cmdlog_pos) && (len < PAGE_SIZE);
 	     i = (i + 1) % priv->cmdlog_len) {
 		len + 		    snprintf(buf + len, PAGE_SIZE - len,
