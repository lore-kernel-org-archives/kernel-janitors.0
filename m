From: Julia Lawall <julia@diku.dk>
Date: Thu, 05 Aug 2010 20:29:38 +0000
Subject: [PATCH 41/42] net/decnet: Adjust confusing if indentation
Message-Id: <Pine.LNX.4.64.1008052229200.31692@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, linux-decnet-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Indent the branch of an if.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable braces4@
position p1,p2;
statement S1,S2;
@@

(
if (...) { ... }
|
if (...) S1@p1 S2@p2
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

if (p1[0].column = p2[0].column):
  cocci.print_main("branch",p1)
  cocci.print_secs("after",p2)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 net/decnet/dn_nsp_out.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/decnet/dn_nsp_out.c b/net/decnet/dn_nsp_out.c
index baeb1ea..2ef1152 100644
--- a/net/decnet/dn_nsp_out.c
+++ b/net/decnet/dn_nsp_out.c
@@ -693,22 +693,22 @@ void dn_nsp_send_conninit(struct sock *sk, unsigned char msgflg)
 	aux = scp->accessdata.acc_userl;
 	*skb_put(skb, 1) = aux;
 	if (aux > 0)
-	memcpy(skb_put(skb, aux), scp->accessdata.acc_user, aux);
+		memcpy(skb_put(skb, aux), scp->accessdata.acc_user, aux);
 
 	aux = scp->accessdata.acc_passl;
 	*skb_put(skb, 1) = aux;
 	if (aux > 0)
-	memcpy(skb_put(skb, aux), scp->accessdata.acc_pass, aux);
+		memcpy(skb_put(skb, aux), scp->accessdata.acc_pass, aux);
 
 	aux = scp->accessdata.acc_accl;
 	*skb_put(skb, 1) = aux;
 	if (aux > 0)
-	memcpy(skb_put(skb, aux), scp->accessdata.acc_acc, aux);
+		memcpy(skb_put(skb, aux), scp->accessdata.acc_acc, aux);
 
 	aux = (__u8)le16_to_cpu(scp->conndata_out.opt_optl);
 	*skb_put(skb, 1) = aux;
 	if (aux > 0)
-	memcpy(skb_put(skb,aux), scp->conndata_out.opt_data, aux);
+		memcpy(skb_put(skb, aux), scp->conndata_out.opt_data, aux);
 
 	scp->persist = dn_nsp_persist(sk);
 	scp->persist_fxn = dn_nsp_retrans_conninit;
