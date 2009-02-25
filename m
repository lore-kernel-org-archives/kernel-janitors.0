From: Hannes Eder <hannes@hanneseder.net>
Date: Wed, 25 Feb 2009 20:31:10 +0000
Subject: [PATCH 0/8] net: fix (sparse) warnings
Message-Id: <20090225203012.6251.32002.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The following series fixes some (sparse) warnings in net/.

---

Hannes Eder (8):
      wanrouter: fix sparse warnings: context imbalance
      inet fragments: fix sparse warning: context imbalance
      decnet: fix sparse warnings: symbol shadows an earlier one
      decnet: fix sparse warnings: context imbalance
      [NET] sysctl: fix sparse warning: Should it be static?
      appletalk: fix warning: format not a string literal and no ...
      9p: fix sparse warning: cast adds address space
      net/802: fix sparse warnings: context imbalance


 include/net/inet_frag.h        |    3 ++-
 net/802/tr.c                   |    2 ++
 net/9p/trans_fd.c              |    2 +-
 net/appletalk/ddp.c            |    2 +-
 net/core/sysctl_net_core.c     |    1 +
 net/decnet/af_decnet.c         |   17 +++++++++--------
 net/decnet/dn_dev.c            |    3 ++-
 net/decnet/sysctl_net_decnet.c |    2 +-
 net/ipv4/inet_fragment.c       |    1 +
 net/wanrouter/wanmain.c        |    8 ++++++--
 net/wanrouter/wanproc.c        |    2 ++
 11 files changed, 28 insertions(+), 15 deletions(-)
