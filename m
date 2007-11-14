From: Julia Lawall <julia@diku.dk>
Date: Wed, 14 Nov 2007 08:13:59 +0000
Subject: [PATCH 1/4] arch/ia64: Drop unnecessary continue
Message-Id: <Pine.LNX.4.64.0711140913170.26019@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tony.luck@intel.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Continue is not needed at the bottom of a loop.

The semantic patch implementing this change is as follows:

@@
statement S;
@@

for (...;...;...) {
   ...
   if (...)
- {
     S
-   continue;
- }
}

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -u -p -b -B a/arch/ia64/sn/kernel/xpnet.c b/arch/ia64/sn/kernel/xpnet.c
--- a/arch/ia64/sn/kernel/xpnet.c 2007-10-22 11:24:57.000000000 +0200
+++ b/arch/ia64/sn/kernel/xpnet.c 2007-11-13 21:56:42.000000000 +0100
@@ -588,10 +588,8 @@ xpnet_dev_hard_start_xmit(struct sk_buff

  		ret = xpc_send_notify(dest_partid, XPC_NET_CHANNEL, msg,
  				      xpnet_send_completed, queued_msg);
-		if (unlikely(ret != xpcSuccess)) {
+		if (unlikely(ret != xpcSuccess))
  			atomic_dec(&queued_msg->use_count);
-			continue;
-		}

  	}

