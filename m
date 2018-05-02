From: Bo YU <tsu.yubo@gmail.com>
Date: Wed, 02 May 2018 09:54:24 +0000
Subject: [PATCH] NET/netlink: optimize output of seq_puts in af_netlink.c
Message-Id: <20180502095421.GA15014@yubo-2>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, Wang <xiyou.wangcong@gmail.com>, yuzibode@126.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Optimization of command output: `cat /proc/net/netlink`

After the patch, we will get:

https://clbin.com/lnu4L

Signed-off-by: Bo YU <tsu.yubo@gmail.com>
---
  net/netlink/af_netlink.c | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index 55342c4d5cec..2e2dd88fc79f 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -2606,13 +2606,13 @@ static int netlink_seq_show(struct seq_file *seq, void *v)
  {
  	if (v = SEQ_START_TOKEN) {
  		seq_puts(seq,
-			 "sk       Eth Pid    Groups   "
-			 "Rmem     Wmem     Dump     Locks     Drops     Inode\n");
+			 "sk               Eth Pid        Groups   "
+			 "Rmem     Wmem     Dump  Locks    Drops    Inode\n");
  	} else {
  		struct sock *s = v;
  		struct netlink_sock *nlk = nlk_sk(s);

-		seq_printf(seq, "%pK %-3d %-6u %08x %-8d %-8d %d %-8d %-8d %-8lu\n",
+		seq_printf(seq, "%pK %-3d %-10u %08x %-8d %-8d %-5d %-8d %-8d %-8lu\n",
  			   s,
  			   s->sk_protocol,
  			   nlk->portid,
--
2.11.0

