From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Aug 2016 08:49:49 +0000
Subject: [bug report] qed: Revisit chain implementation
Message-Id: <20160803084949.GA2154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Yuval Mintz,

The patch a91eb52abb50: "qed: Revisit chain implementation" from Jun
3, 2016, leads to the following static checker warning:

	include/linux/qed/qed_chain.h:404 qed_chain_consume()
	warn: inconsistent indenting

include/linux/qed/qed_chain.h
   386  static inline void *qed_chain_consume(struct qed_chain *p_chain)
   387  {
   388          void *p_ret = NULL, *p_cons_idx, *p_cons_page_idx;
   389  
   390          if (is_chain_u16(p_chain)) {
   391                  if ((p_chain->u.chain16.cons_idx &
   392                       p_chain->elem_per_page_mask) = p_chain->next_page_mask) {
   393                          p_cons_idx = &p_chain->u.chain16.cons_idx;
   394                          p_cons_page_idx = &p_chain->pbl.u.pbl16.cons_page_idx;
   395                          qed_chain_advance_page(p_chain, &p_chain->p_cons_elem,
   396                                                 p_cons_idx, p_cons_page_idx);
   397                  }
   398                  p_chain->u.chain16.cons_idx++;
   399          } else {
   400                  if ((p_chain->u.chain32.cons_idx &
   401                       p_chain->elem_per_page_mask) = p_chain->next_page_mask) {
   402                          p_cons_idx = &p_chain->u.chain32.cons_idx;
   403                          p_cons_page_idx = &p_chain->pbl.u.pbl32.cons_page_idx;
   404                  qed_chain_advance_page(p_chain, &p_chain->p_cons_elem,
                        ^^^^^^^^^^^^^^^^^^^^^^
Add a tab?

   405                                                 p_cons_idx, p_cons_page_idx);
   406                  }
   407                  p_chain->u.chain32.cons_idx++;
   408          }
   409  
   410          p_ret = p_chain->p_cons_elem;
   411          p_chain->p_cons_elem = (void *)(((u8 *)p_chain->p_cons_elem) +
   412                                          p_chain->elem_size);
   413  
   414          return p_ret;
   415  }

regards,
dan carpenter
