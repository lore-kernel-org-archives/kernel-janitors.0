From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 25 Jul 2018 05:58:17 +0000
Subject: [PATCH net-next] net: igmp: make function __ip_mc_inc_group() static
Message-Id: <1532498773-188363-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Hangbin Liu <liuhangbin@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warnings:

net/ipv4/igmp.c:1391:6: warning:
 symbol '__ip_mc_inc_group' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/ipv4/igmp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/igmp.c b/net/ipv4/igmp.c
index 598333b..c9f8d46 100644
--- a/net/ipv4/igmp.c
+++ b/net/ipv4/igmp.c
@@ -1388,7 +1388,8 @@ static void ip_mc_hash_remove(struct in_device *in_dev,
 /*
  *	A socket has joined a multicast group on device dev.
  */
-void __ip_mc_inc_group(struct in_device *in_dev, __be32 addr, unsigned int mode)
+static void __ip_mc_inc_group(struct in_device *in_dev, __be32 addr,
+			      unsigned int mode)
 {
 	struct ip_mc_list *im;
 #ifdef CONFIG_IP_MULTICAST

