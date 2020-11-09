From: Colin King <colin.king@canonical.com>
Date: Mon, 09 Nov 2020 12:52:15 +0000
Subject: [PATCH][next] mptcp: fix a dereference of pointer before msk is null checked.
Message-Id: <20201109125215.2080172-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mat Martineau <mathew.j.martineau@linux.intel.com>, Matthieu Baerts <matthieu.baerts@tessares.net>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Geliang Tang <geliangtang@gmail.com>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, mptcp@lists.01.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the assignment of pointer net from the sock_net(sk) call
is potentially dereferencing a null pointer sk. sk points to the
same location as pointer msk and msk is being null checked after
the sock_net call.  Fix this by calling sock_net after the null
check on pointer msk.

Addresses-Coverity: ("Dereference before null check")
Fixes: 00cfd77b9063 ("mptcp: retransmit ADD_ADDR when timeout")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/mptcp/pm_netlink.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/mptcp/pm_netlink.c b/net/mptcp/pm_netlink.c
index ed60538df7b2..e76879ea5a30 100644
--- a/net/mptcp/pm_netlink.c
+++ b/net/mptcp/pm_netlink.c
@@ -206,13 +206,15 @@ static void mptcp_pm_add_timer(struct timer_list *timer)
 	struct mptcp_pm_add_entry *entry = from_timer(entry, timer, add_timer);
 	struct mptcp_sock *msk = entry->sock;
 	struct sock *sk = (struct sock *)msk;
-	struct net *net = sock_net(sk);
+	struct net *net;
 
 	pr_debug("msk=%p", msk);
 
 	if (!msk)
 		return;
 
+	net = sock_net(sk);
+
 	if (inet_sk_state_load(sk) = TCP_CLOSE)
 		return;
 
-- 
2.28.0
