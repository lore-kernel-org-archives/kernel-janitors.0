From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Mar 2015 21:04:25 +0000
Subject: re: fib_trie: Add tnode struct as a container for fields not needed in key_vector
Message-Id: <20150310210425.GA10841@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Alexander Duyck,

The patch dc35dbeda3e0: "fib_trie: Add tnode struct as a container
for fields not needed in key_vector" from Mar 6, 2015, leads to the
following static checker warnings:

net/ipv4/fib_trie.c:330 leaf_new() warn: variable dereferenced before check 'kv' (see line 328)
net/ipv4/fib_trie.c:358 tnode_new() warn: variable dereferenced before check 'tnode' (see line 350)
net/ipv4/fib_trie.c:853 resize() error: we previously assumed 'tp' could be null (see line 835)
net/ipv4/fib_trie.c:1891 fib_trie_get_first() warn: variable dereferenced before check 't' (see line 1889)

net/ipv4/fib_trie.c
   325  static struct key_vector *leaf_new(t_key key, struct fib_alias *fa)
   326  {
   327          struct tnode *kv = kmem_cache_alloc(trie_leaf_kmem, GFP_KERNEL);
   328          struct key_vector *l = kv->kv;
                                       ^^^^^^
Deref.

   329  
   330          if (!kv)
                    ^^^
Check.

   331                  return NULL;
   332  
   333          /* initialize key vector */
   334          l->key = key;
   335          l->pos = 0;
   336          l->bits = 0;
   337          l->slen = fa->fa_slen;
   338  
   339          /* link leaf to fib alias */
   340          INIT_HLIST_HEAD(&l->leaf);
   341          hlist_add_head(&fa->fa_list, &l->leaf);
   342  
   343          return l;
   344  }

[ snip ]

   833          while (should_inflate(tp, tn) && max_work) {
   834                  tp = inflate(t, tn);
   835                  if (!tp) {
                            ^^^
Is NULL here.

   836  #ifdef CONFIG_IP_FIB_TRIE_STATS
   837                          this_cpu_inc(stats->resize_node_skipped);
   838  #endif
   839                          break;
   840                  }
   841  
   842                  max_work--;
   843                  tn = get_child(tp, cindex);
   844          }
   845  
   846          /* Return if at least one inflate is run */
   847          if (max_work != MAX_WORK)
   848                  return node_parent(tn);
   849  
   850          /* Halve as long as the number of empty children in this
   851           * node is above threshold.
   852           */
   853          while (should_halve(tp, tn) && max_work) {
                        ^^^^^^^^^^^
should_halve() used to check for NULL but now it dereferences
unconditionally.

   854                  tp = halve(t, tn);
   855                  if (!tp) {
   856  #ifdef CONFIG_IP_FIB_TRIE_STATS
   857                          this_cpu_inc(stats->resize_node_skipped);
   858  #endif
   859                          break;
   860                  }
   861  
   862                  max_work--;
   863                  tn = get_child(tp, cindex);
   864          }

regards,
dan carpenters 
