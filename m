From: Dan Carpenter <error27@gmail.com>
Date: Thu, 22 Apr 2010 09:50:10 +0000
Subject: [patch] wimax: checking ERR_PTR vs null
Message-Id: <20100422095010.GN29647@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: Inaky Perez-Gonzalez <inaky@linux.intel.com>, Alexey Dobriyan <adobriyan@gmail.com>, Paulius Zaleckas <paulius.zaleckas@teltonika.lt>, "David S. Miller" <davem@davemloft.net>, wimax@linuxwimax.org, kernel-janitors@vger.kernel.org

stch_skb is allocated with wimax_gnl_re_state_change_alloc().  That
function returns ERR_PTRs on failure and doesn't return NULL.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/wimax/stack.c b/net/wimax/stack.c
index 1ed65db..62b1a66 100644
--- a/net/wimax/stack.c
+++ b/net/wimax/stack.c
@@ -315,7 +315,7 @@ void __wimax_state_change(struct wimax_dev *wimax_dev, enum wimax_st new_state)
 		BUG();
 	}
 	__wimax_state_set(wimax_dev, new_state);
-	if (stch_skb)
+	if (!IS_ERR(stch_skb))
 		wimax_gnl_re_state_change_send(wimax_dev, stch_skb, header);
 out:
 	d_fnend(3, dev, "(wimax_dev %p new_state %u [old %u]) = void\n",
