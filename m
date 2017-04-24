From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Mon, 24 Apr 2017 07:48:12 +0000
Subject: Re: [bug report] esp4: Reorganize esp_output
Message-Id: <20170424074812.GO2649@secunet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170421204932.kuy6c2ivmqn7dk65@mwanda>
In-Reply-To: <20170421204932.kuy6c2ivmqn7dk65@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Apr 21, 2017 at 11:49:32PM +0300, Dan Carpenter wrote:
> Hello Steffen Klassert,
> 
> The patch fca11ebde3f0: "esp4: Reorganize esp_output" from Apr 14,
> 2017, leads to the following static checker warning:
> 
> 	net/ipv4/esp4.c:444 esp_output_tail()
> 	error: locking inconsistency.  We assume 'spin_lock:&x->lock' is both locked and unlocked at the start.
> 
> net/ipv4/esp4.c
>    353  
>    354          aead = x->data;
>    355          alen = crypto_aead_authsize(aead);
>    356          ivlen = crypto_aead_ivsize(aead);
>    357  
>    358          tmp = esp_alloc_tmp(aead, esp->nfrags + 2, extralen);
>    359          if (!tmp) {
>    360                  spin_unlock_bh(&x->lock);
>                         ^^^^^^^^^^^^^^^^^^^^^^^^

Good catch!

This is a copy and paste bug. I moved esp_alloc_tmp() out of a locked
section but forgot to remove the unlock in the error path.

> Here we assume we're called with the lock held.
> 
>    361                  err = -ENOMEM;
>    362                  goto error;
>    363          }
>    364  
>    365          extra = esp_tmp_extra(tmp);
>    366          iv = esp_tmp_iv(aead, tmp, extralen);
>    367          req = esp_tmp_req(aead, iv);
>    368          sg = esp_req_sg(aead, req);
>    369  
>    370          if (esp->inplace)
>    371                  dsg = sg;
>    372          else
>    373                  dsg = &sg[esp->nfrags];
>    374  
>    375          esph = esp_output_set_extra(skb, x, esp->esph, extra);
>    376          esp->esph = esph;
>    377  
>    378          sg_init_table(sg, esp->nfrags);
>    379          skb_to_sgvec(skb, sg,
>    380                       (unsigned char *)esph - skb->data,
>    381                       assoclen + ivlen + esp->clen + alen);
>    382  
>    383          if (!esp->inplace) {
>    384                  int allocsize;
>    385                  struct page_frag *pfrag = &x->xfrag;
>    386  
>    387                  allocsize = ALIGN(skb->data_len, L1_CACHE_BYTES);
>    388  
>    389                  spin_lock_bh(&x->lock);
>                         ^^^^^^^^^^^^^^^^^^^^^^
> But here we take it ourselves.
> 
>    390                  if (unlikely(!skb_page_frag_refill(allocsize, pfrag, GFP_ATOMIC))) {
>    391                          spin_unlock_bh(&x->lock);
>    392                          err = -ENOMEM;
>    393                          goto error;
>    394                  }
>    395  
> 
> Same thing in ipv6.  Which is weird and suggests that I'm reading the
> code wrong...

You are reading the code correct :)
I've just did the same thing for both, esp4 and esp6.

I plan to fix this with the patch below:

Subject: [PATCH] esp: Fix misplaced spin_unlock_bh.

A recent commit moved esp_alloc_tmp() out of a lock
protected region, but forgot to remove the unlock from
the error path. This patch removes the forgotten unlock.
While at it, remove some unneeded error assignments too.

Fixes: fca11ebde3f0 ("esp4: Reorganize esp_output")
Fixes: 383d0350f2cc ("esp6: Reorganize esp_output")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Steffen Klassert <steffen.klassert@secunet.com>
---
 net/ipv4/esp4.c | 6 +-----
 net/ipv6/esp6.c | 6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/net/ipv4/esp4.c b/net/ipv4/esp4.c
index 7e501ad..7f2caf7 100644
--- a/net/ipv4/esp4.c
+++ b/net/ipv4/esp4.c
@@ -356,11 +356,8 @@ int esp_output_tail(struct xfrm_state *x, struct sk_buff *skb, struct esp_info *
 	ivlen = crypto_aead_ivsize(aead);
 
 	tmp = esp_alloc_tmp(aead, esp->nfrags + 2, extralen);
-	if (!tmp) {
-		spin_unlock_bh(&x->lock);
-		err = -ENOMEM;
+	if (!tmp)
 		goto error;
-	}
 
 	extra = esp_tmp_extra(tmp);
 	iv = esp_tmp_iv(aead, tmp, extralen);
@@ -389,7 +386,6 @@ int esp_output_tail(struct xfrm_state *x, struct sk_buff *skb, struct esp_info *
 		spin_lock_bh(&x->lock);
 		if (unlikely(!skb_page_frag_refill(allocsize, pfrag, GFP_ATOMIC))) {
 			spin_unlock_bh(&x->lock);
-			err = -ENOMEM;
 			goto error;
 		}
 
diff --git a/net/ipv6/esp6.c b/net/ipv6/esp6.c
index 8b55abf..1fe99ba 100644
--- a/net/ipv6/esp6.c
+++ b/net/ipv6/esp6.c
@@ -330,11 +330,8 @@ int esp6_output_tail(struct xfrm_state *x, struct sk_buff *skb, struct esp_info
 	ivlen = crypto_aead_ivsize(aead);
 
 	tmp = esp_alloc_tmp(aead, esp->nfrags + 2, seqhilen);
-	if (!tmp) {
-		spin_unlock_bh(&x->lock);
-		err = -ENOMEM;
+	if (!tmp)
 		goto error;
-	}
 
 	seqhi = esp_tmp_seqhi(tmp);
 	iv = esp_tmp_iv(aead, tmp, seqhilen);
@@ -362,7 +359,6 @@ int esp6_output_tail(struct xfrm_state *x, struct sk_buff *skb, struct esp_info
 		spin_lock_bh(&x->lock);
 		if (unlikely(!skb_page_frag_refill(allocsize, pfrag, GFP_ATOMIC))) {
 			spin_unlock_bh(&x->lock);
-			err = -ENOMEM;
 			goto error;
 		}
 
-- 
2.7.4

