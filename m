From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 20 Apr 2017 10:21:30 +0000
Subject: [PATCH] net: qrtr: potential use after free in qrtr_sendmsg()
Message-Id: <20170420102130.jhafz7e532y5iqd4@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Courtney Cavin <courtney.cavin@sonymobile.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, David Ahern <dsa@cumulusnetworks.com>, Stephen Boyd <sboyd@codeaurora.org>, Johannes Berg <johannes.berg@intel.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

If skb_pad() fails then it frees the skb so we should check for errors.

Fixes: bdabad3e363d ("net: Add Qualcomm IPC router")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/qrtr/qrtr.c b/net/qrtr/qrtr.c
index c36b0ec364a4..a9a8c7d5a4a9 100644
--- a/net/qrtr/qrtr.c
+++ b/net/qrtr/qrtr.c
@@ -658,7 +658,9 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 	}
 
 	if (plen != len) {
-		skb_pad(skb, plen - len);
+		rc = skb_pad(skb, plen - len);
+		if (rc)
+			goto out_node;
 		skb_put(skb, plen - len);
 	}
 
