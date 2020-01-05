From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 05 Jan 2020 17:36:07 +0000
Subject: [PATCH] gtp: simplify error handling code in 'gtp_encap_enable()'
Message-Id: <20200105173607.5456-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pablo@netfilter.org, laforge@gnumonks.org, davem@davemloft.net
Cc: osmocom-net-gprs@lists.osmocom.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'gtp_encap_disable_sock(sk)' handles the case where sk is NULL, so there
is no need to test it before calling the function.

This saves a few line of code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/gtp.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/gtp.c b/drivers/net/gtp.c
index ecfe26215935..1499b4a37758 100644
--- a/drivers/net/gtp.c
+++ b/drivers/net/gtp.c
@@ -849,8 +849,7 @@ static int gtp_encap_enable(struct gtp_dev *gtp, struct nlattr *data[])
 
 		sk1u = gtp_encap_enable_socket(fd1, UDP_ENCAP_GTP1U, gtp);
 		if (IS_ERR(sk1u)) {
-			if (sk0)
-				gtp_encap_disable_sock(sk0);
+			gtp_encap_disable_sock(sk0);
 			return PTR_ERR(sk1u);
 		}
 	}
@@ -858,10 +857,8 @@ static int gtp_encap_enable(struct gtp_dev *gtp, struct nlattr *data[])
 	if (data[IFLA_GTP_ROLE]) {
 		role = nla_get_u32(data[IFLA_GTP_ROLE]);
 		if (role > GTP_ROLE_SGSN) {
-			if (sk0)
-				gtp_encap_disable_sock(sk0);
-			if (sk1u)
-				gtp_encap_disable_sock(sk1u);
+			gtp_encap_disable_sock(sk0);
+			gtp_encap_disable_sock(sk1u);
 			return -EINVAL;
 		}
 	}
-- 
2.20.1
