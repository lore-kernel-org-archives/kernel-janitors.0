From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Jul 2017 06:16:54 +0000
Subject: [PATCH 0/2] constify net_protocol structures
Message-Id: <1501309016-16059-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

The net_protocol structure is only passed as the first argument to
inet_add_protocol or inet_del_protocol, both of which are declared
as const.  Thus the net_protocol structure itself can be const.

Done with the help of Coccinelle.

---

 net/ipv4/af_inet.c |    4 ++--
 net/l2tp/l2tp_ip.c |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
