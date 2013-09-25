From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2013 08:57:30 +0000
Subject: [patch] mwifiex: potential integer underflow in mwifiex_ret_wmm_get_status()
Message-Id: <20130925085729.GC6661@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bing Zhao <bzhao@marvell.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

If "resp_len" gets set to negative then it counts as a high positive
value.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I spotted this reviewing the int => bool changes, but I don't have the
hardware and can't test it.

diff --git a/drivers/net/wireless/mwifiex/wmm.c b/drivers/net/wireless/mwifiex/wmm.c
index 2e8f9cd..3c6ee3a 100644
--- a/drivers/net/wireless/mwifiex/wmm.c
+++ b/drivers/net/wireless/mwifiex/wmm.c
@@ -772,6 +772,8 @@ int mwifiex_ret_wmm_get_status(struct mwifiex_private *priv,
 			break;
 		}
 
+		if (resp_len < tlv_len + sizeof(tlv_hdr->header))
+			break;
 		curr += (tlv_len + sizeof(tlv_hdr->header));
 		resp_len -= (tlv_len + sizeof(tlv_hdr->header));
 	}
