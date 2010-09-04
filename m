From: Dan Carpenter <error27@gmail.com>
Date: Sat, 04 Sep 2010 13:14:35 +0000
Subject: [patch] irda: off by one
Message-Id: <20100904131435.GL5437@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <samuel@sortiz.org>
Cc: "David S. Miller" <davem@davemloft.net>, Alexey Dobriyan <adobriyan@gmail.com>, Li Zefan <lizf@cn.fujitsu.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This is an off by one.  We would go past the end when we NUL terminate
the "value" string at end of the function.  The "value" buffer is
allocated in irlan_client_parse_response() or
irlan_provider_parse_command().

CC: stable@kernel.org
Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/irda/irlan/irlan_common.c b/net/irda/irlan/irlan_common.c
index a788f9e..6130f9d 100644
--- a/net/irda/irlan/irlan_common.c
+++ b/net/irda/irlan/irlan_common.c
@@ -1102,7 +1102,7 @@ int irlan_extract_param(__u8 *buf, char *name, char *value, __u16 *len)
 	memcpy(&val_len, buf+n, 2); /* To avoid alignment problems */
 	le16_to_cpus(&val_len); n+=2;
 
-	if (val_len > 1016) {
+	if (val_len >= 1016) {
 		IRDA_DEBUG(2, "%s(), parameter length to long\n", __func__ );
 		return -RSP_INVALID_COMMAND_FORMAT;
 	}
