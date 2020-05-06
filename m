From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 May 2020 10:17:53 +0000
Subject: [PATCH net] netfilter: nf_conntrack_pptp: prevent buffer overflows in debug code
Message-Id: <20200506101753.GD77004@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that the value for "cmd" comes from the network and
can't be trusted.  The value is actually checked at the end of these
functions so I just copied that here as well.

Fixes: f09943fefe6b ("[NETFILTER]: nf_conntrack/nf_nat: add PPTP helper port")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/netfilter/nf_conntrack_pptp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/netfilter/nf_conntrack_pptp.c b/net/netfilter/nf_conntrack_pptp.c
index a971183f11af7..b4dc567f7fb68 100644
--- a/net/netfilter/nf_conntrack_pptp.c
+++ b/net/netfilter/nf_conntrack_pptp.c
@@ -276,7 +276,8 @@ pptp_inbound_pkt(struct sk_buff *skb, unsigned int protoff,
 	typeof(nf_nat_pptp_hook_inbound) nf_nat_pptp_inbound;
 
 	msg = ntohs(ctlh->messageType);
-	pr_debug("inbound control message %s\n", pptp_msg_name[msg]);
+	pr_debug("inbound control message %s\n",
+		 msg <= PPTP_MSG_MAX ? pptp_msg_name[msg] : pptp_msg_name[0]);
 
 	switch (msg) {
 	case PPTP_START_SESSION_REPLY:
@@ -404,7 +405,8 @@ pptp_outbound_pkt(struct sk_buff *skb, unsigned int protoff,
 	typeof(nf_nat_pptp_hook_outbound) nf_nat_pptp_outbound;
 
 	msg = ntohs(ctlh->messageType);
-	pr_debug("outbound control message %s\n", pptp_msg_name[msg]);
+	pr_debug("outbound control message %s\n",
+		 msg <= PPTP_MSG_MAX ? pptp_msg_name[msg] : pptp_msg_name[0]);
 
 	switch (msg) {
 	case PPTP_START_SESSION_REQUEST:
-- 
2.26.2
