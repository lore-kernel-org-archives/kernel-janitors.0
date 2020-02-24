From: Colin King <colin.king@canonical.com>
Date: Mon, 24 Feb 2020 17:35:53 +0000
Subject: [PATCH][next] net: qrtr: fix spelling mistake "serivce" -> "service"
Message-Id: <20200224173553.386446-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a pr_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/qrtr/ns.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index 67a4e59cdf4d..7bfde01f4e8a 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -150,7 +150,7 @@ static int service_announce_del(struct sockaddr_qrtr *dest,
 
 	ret = kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
 	if (ret < 0)
-		pr_err("failed to announce del serivce\n");
+		pr_err("failed to announce del service\n");
 
 	return ret;
 }
-- 
2.25.0
