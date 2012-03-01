From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Thu, 01 Mar 2012 09:29:14 +0000
Subject: [PATCH 2/3] netfilter: potential null derefence.
Message-Id: <1330593434-19275-1-git-send-email-santoshprasadnayak@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bart.de.schuymer@pandora.be
Cc: pablo@netfilter.org, kaber@trash.net, shemminger@vyatta.com, davem@davemloft.net, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, bridge@lists.linux-foundation.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Santosh Nayak <santoshprasadnayak@gmail.com>

From: Santosh Nayak <santoshprasadnayak@gmail.com>

I am getting following error.
" net/bridge/netfilter/ebtables.c:269 ebt_do_table()
  error: potential null derefence 'cs'"

    i = cs[sp].n;  // If cs = Null then this will cause problem.

Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
---
 net/bridge/netfilter/ebtables.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/net/bridge/netfilter/ebtables.c b/net/bridge/netfilter/ebtables.c
index f3fcbd9..9c0f177 100644
--- a/net/bridge/netfilter/ebtables.c
+++ b/net/bridge/netfilter/ebtables.c
@@ -209,8 +209,10 @@ unsigned int ebt_do_table (unsigned int hook, struct sk_buff *skb,
 	   smp_processor_id());
 	if (private->chainstack)
 		cs = private->chainstack[smp_processor_id()];
-	else
+	else {
 		cs = NULL;
+		goto out;
+	}
 	chaininfo = private->hook_entry[hook];
 	nentries = private->hook_entry[hook]->nentries;
 	point = (struct ebt_entry *)(private->hook_entry[hook]->data);
@@ -313,6 +315,7 @@ letscontinue:
 		read_unlock_bh(&table->lock);
 		return NF_ACCEPT;
 	}
+out:
 	read_unlock_bh(&table->lock);
 	return NF_DROP;
 }
-- 
1.7.4.4

