From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Jul 2017 06:40:52 +0000
Subject: [PATCH 0/2] constify nf_hook_ops structures
Message-Id: <1501310455-7896-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-decnet-user@lists.sourceforge.net
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

The nf_hook_ops structure is only passed as the second argument to
nf_register_net_hook or nf_unregister_net_hook, both of which are
declared as const.  Thus the nf_hook_ops structure itself can be
const.

Done with the help of Coccinelle.

---

 net/decnet/netfilter/dn_rtmsg.c    |    2 +-
 net/ipv4/netfilter/ipt_CLUSTERIP.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
