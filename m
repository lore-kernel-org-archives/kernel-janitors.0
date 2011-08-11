From: Julia Lawall <julia@diku.dk>
Date: Thu, 11 Aug 2011 11:59:38 +0000
Subject: [PATCH] net/bridge/netfilter/ebtables.c: use available error handling code
Message-Id: <1313063978-29400-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bart De Schuymer <bart.de.schuymer@pandora.be>
Cc: kernel-janitors@vger.kernel.org, Patrick McHardy <kaber@trash.net>, Stephen Hemminger <shemminger@linux-foundation.org>, davem@davemloft.net, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, bridge@lists.linux-foundation.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Free the locally allocated table and newinfo as done in adjacent error
handling code.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 net/bridge/netfilter/ebtables.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/bridge/netfilter/ebtables.c b/net/bridge/netfilter/ebtables.c
index 2b5ca1a..5864cc4 100644
--- a/net/bridge/netfilter/ebtables.c
+++ b/net/bridge/netfilter/ebtables.c
@@ -1198,7 +1198,8 @@ ebt_register_table(struct net *net, const struct ebt_table *input_table)
 
 	if (table->check && table->check(newinfo, table->valid_hooks)) {
 		BUGPRINT("The table doesn't like its own initial data, lol\n");
-		return ERR_PTR(-EINVAL);
+		ret = -EINVAL;
+		goto free_chainstack;
 	}
 
 	table->private = newinfo;

