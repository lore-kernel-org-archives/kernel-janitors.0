From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Apr 2017 20:49:32 +0000
Subject: [bug report] esp4: Reorganize esp_output
Message-Id: <20170421204932.kuy6c2ivmqn7dk65@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Steffen Klassert,

The patch fca11ebde3f0: "esp4: Reorganize esp_output" from Apr 14,
2017, leads to the following static checker warning:

	net/ipv4/esp4.c:444 esp_output_tail()
	error: locking inconsistency.  We assume 'spin_lock:&x->lock' is both locked and unlocked at the start.

net/ipv4/esp4.c
   353  
   354          aead = x->data;
   355          alen = crypto_aead_authsize(aead);
   356          ivlen = crypto_aead_ivsize(aead);
   357  
   358          tmp = esp_alloc_tmp(aead, esp->nfrags + 2, extralen);
   359          if (!tmp) {
   360                  spin_unlock_bh(&x->lock);
                        ^^^^^^^^^^^^^^^^^^^^^^^^
Here we assume we're called with the lock held.

   361                  err = -ENOMEM;
   362                  goto error;
   363          }
   364  
   365          extra = esp_tmp_extra(tmp);
   366          iv = esp_tmp_iv(aead, tmp, extralen);
   367          req = esp_tmp_req(aead, iv);
   368          sg = esp_req_sg(aead, req);
   369  
   370          if (esp->inplace)
   371                  dsg = sg;
   372          else
   373                  dsg = &sg[esp->nfrags];
   374  
   375          esph = esp_output_set_extra(skb, x, esp->esph, extra);
   376          esp->esph = esph;
   377  
   378          sg_init_table(sg, esp->nfrags);
   379          skb_to_sgvec(skb, sg,
   380                       (unsigned char *)esph - skb->data,
   381                       assoclen + ivlen + esp->clen + alen);
   382  
   383          if (!esp->inplace) {
   384                  int allocsize;
   385                  struct page_frag *pfrag = &x->xfrag;
   386  
   387                  allocsize = ALIGN(skb->data_len, L1_CACHE_BYTES);
   388  
   389                  spin_lock_bh(&x->lock);
                        ^^^^^^^^^^^^^^^^^^^^^^
But here we take it ourselves.

   390                  if (unlikely(!skb_page_frag_refill(allocsize, pfrag, GFP_ATOMIC))) {
   391                          spin_unlock_bh(&x->lock);
   392                          err = -ENOMEM;
   393                          goto error;
   394                  }
   395  

Same thing in ipv6.  Which is weird and suggests that I'm reading the
code wrong...

net/ipv6/esp6.c:417 esp6_output_tail()
error: locking inconsistency.  We assume 'spin_lock:&x->lock' is both locked and unlocked at the start.

regards,
dan carpenter
