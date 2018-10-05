From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 05 Oct 2018 06:43:27 +0000
Subject: [PATCH -next] crypto: chtls - remove set but not used variable 'csk'
Message-Id: <1538721807-120297-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/crypto/chelsio/chtls/chtls_cm.c: In function 'chtls_disconnect':
drivers/crypto/chelsio/chtls/chtls_cm.c:408:21: warning:
 variable 'csk' set but not used [-Wunused-but-set-variable]
 
drivers/crypto/chelsio/chtls/chtls_cm.c: In function 'chtls_recv_sock':
drivers/crypto/chelsio/chtls/chtls_cm.c:1016:23: warning:
 variable 'tcph' set but not used [-Wunused-but-set-variable]
 
'csk' and 'tcph' are never used since introduce
in commit cc35c88ae4db ("crypto : chtls - CPL handler definition")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/crypto/chelsio/chtls/chtls_cm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/crypto/chelsio/chtls/chtls_cm.c b/drivers/crypto/chelsio/chtls/chtls_cm.c
index fd2ae1e..20209e2 100644
--- a/drivers/crypto/chelsio/chtls/chtls_cm.c
+++ b/drivers/crypto/chelsio/chtls/chtls_cm.c
@@ -405,12 +405,10 @@ static int wait_for_states(struct sock *sk, unsigned int states)
 
 int chtls_disconnect(struct sock *sk, int flags)
 {
-	struct chtls_sock *csk;
 	struct tcp_sock *tp;
 	int err;
 
 	tp = tcp_sk(sk);
-	csk = rcu_dereference_sk_user_data(sk);
 	chtls_purge_recv_queue(sk);
 	chtls_purge_receive_queue(sk);
 	chtls_purge_write_queue(sk);
@@ -1013,7 +1011,6 @@ static struct sock *chtls_recv_sock(struct sock *lsk,
 				    const struct cpl_pass_accept_req *req,
 				    struct chtls_dev *cdev)
 {
-	const struct tcphdr *tcph;
 	struct inet_sock *newinet;
 	const struct iphdr *iph;
 	struct net_device *ndev;
@@ -1035,7 +1032,6 @@ static struct sock *chtls_recv_sock(struct sock *lsk,
 	if (!dst)
 		goto free_sk;
 
-	tcph = (struct tcphdr *)(iph + 1);
 	n = dst_neigh_lookup(dst, &iph->saddr);
 	if (!n)
 		goto free_sk;
