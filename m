From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 11 Oct 2020 10:34:58 +0000
Subject: [PATCH 5/5] net/tls: use semicolons rather than commas to separate statements
Message-Id: <1602412498-32025-6-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1602412498-32025-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1602412498-32025-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Pismenny <borisp@nvidia.com>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, Aviad Yehezkel <aviadye@nvidia.com>, John Fastabend <john.fastabend@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Replace commas with semicolons.  Commas introduce unnecessary
variability in the code structure and are hard to see.  What is done
is essentially described by the following Coccinelle semantic patch
(http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 net/tls/tls_main.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
index 002b0859fed5..8d93cea99f2c 100644
--- a/net/tls/tls_main.c
+++ b/net/tls/tls_main.c
@@ -869,7 +869,7 @@ static int __init tls_register(void)
 
 	tls_sw_proto_ops = inet_stream_ops;
 	tls_sw_proto_ops.splice_read = tls_sw_splice_read;
-	tls_sw_proto_ops.sendpage_locked   = tls_sw_sendpage_locked,
+	tls_sw_proto_ops.sendpage_locked   = tls_sw_sendpage_locked;
 
 	tls_device_init();
 	tcp_register_ulp(&tcp_tls_ulp_ops);
