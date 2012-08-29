From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 29 Aug 2012 16:49:15 +0000
Subject: [PATCH 5/7] net/xfrm/xfrm_state.c: fix error return code
Message-Id: <1346258957-7649-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346258957-7649-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1346258957-7649-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Initialize return variable before exiting on an error path.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}

// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 net/xfrm/xfrm_state.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index 7856c33..b68e0cc 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -1994,8 +1994,10 @@ int __xfrm_init_state(struct xfrm_state *x, bool init_replay)
 		goto error;
 
 	x->outer_mode = xfrm_get_mode(x->props.mode, family);
-	if (x->outer_mode = NULL)
+	if (x->outer_mode = NULL) {
+		err = -EPROTONOSUPPORT;
 		goto error;
+	}
 
 	if (init_replay) {
 		err = xfrm_init_replay(x);

