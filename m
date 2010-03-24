From: Dan Carpenter <error27@gmail.com>
Date: Wed, 24 Mar 2010 11:57:30 +0000
Subject: [patch] rds: cleanup: remove unneeded variable
Message-Id: <20100324115730.GF21571@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Grover <andy.grover@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Stephen Hemminger <shemminger@vyatta.com>, Alexey Dobriyan <adobriyan@gmail.com>, Eric Paris <eparis@redhat.com>, rds-devel@oss.oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We never use "sk" so this patch removes it.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/rds/af_rds.c b/net/rds/af_rds.c
index 853c52b..9abc825 100644
--- a/net/rds/af_rds.c
+++ b/net/rds/af_rds.c
@@ -446,7 +446,6 @@ static void rds_sock_inc_info(struct socket *sock, unsigned int len,
 			      struct rds_info_lengths *lens)
 {
 	struct rds_sock *rs;
-	struct sock *sk;
 	struct rds_incoming *inc;
 	unsigned long flags;
 	unsigned int total = 0;
@@ -456,7 +455,6 @@ static void rds_sock_inc_info(struct socket *sock, unsigned int len,
 	spin_lock_irqsave(&rds_sock_lock, flags);
 
 	list_for_each_entry(rs, &rds_sock_list, rs_item) {
-		sk = rds_rs_to_sk(rs);
 		read_lock(&rs->rs_recv_lock);
 
 		/* XXX too lazy to maintain counts.. */
