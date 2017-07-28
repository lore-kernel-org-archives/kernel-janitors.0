From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 28 Jul 2017 20:18:56 +0000
Subject: [PATCH 0/2] constify inet6_protocol structures
Message-Id: <1501273138-22771-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: kernel-janitors@vger.kernel.org, bhumirks@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

The inet6_protocol structure is only passed as the first argument to
inet6_add_protocol or inet6_del_protocol, both of which are declared as
const.  Thus the inet6_protocol structure itself can be const.

Done with the help of Coccinelle.

// <smpl>
@r disable optional_qualifier@
identifier i;
position p;
@@

static struct inet6_protocol i@p = { ... };

@ok1@
identifier r.i;
expression e1;
position p;
@@

 \(inet6_add_protocol\|inet6_del_protocol\)(&i@p,...)

@bad@
position p != {r.p,ok1.p};
identifier r.i;
struct inet6_protocol e;
@@

e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@

static
+const
 struct inet6_protocol i = { ... };
// </smpl>

---

 net/ipv6/ip6_gre.c  |    2 +-
 net/ipv6/tcp_ipv6.c |    2 +-
 net/ipv6/udp.c      |    2 +-
 net/l2tp/l2tp_ip6.c |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
