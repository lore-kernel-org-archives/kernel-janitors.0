From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Apr 2017 13:08:07 +0000
Subject: [bug report] lwt: Add support to redirect dst.input
Message-Id: <20170419130807.6b4ydlz3npfafb4s@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Tom,

I was reviewing static checker warnings and I had a question about
commit 2536862311d2: "lwt: Add support to redirect dst.input".

net/core/lwtunnel.c
   358  int lwtunnel_input(struct sk_buff *skb)
   359  {
   360          struct dst_entry *dst = skb_dst(skb);
   361          const struct lwtunnel_encap_ops *ops;
   362          struct lwtunnel_state *lwtstate;
   363          int ret = -EINVAL;
   364  
   365          if (!dst)
   366                  goto drop;
   367          lwtstate = dst->lwtstate;
   368  
   369          if (lwtstate->type = LWTUNNEL_ENCAP_NONE ||
   370              lwtstate->type > LWTUNNEL_ENCAP_MAX)
   371                  return 0;

We should probably do a kfree_skb(skb) before returning, right?  It
looks like all the other paths through this function do that.  Probably
the same thing with the other output and xmit functions as well.

   372  
   373          ret = -EOPNOTSUPP;
   374          rcu_read_lock();
   375          ops = rcu_dereference(lwtun_encaps[lwtstate->type]);
   376          if (likely(ops && ops->input))
   377                  ret = ops->input(skb);
   378          rcu_read_unlock();
   379  
   380          if (ret = -EOPNOTSUPP)
   381                  goto drop;
   382  
   383          return ret;
   384  
   385  drop:
   386          kfree_skb(skb);
   387  
   388          return ret;
   389  }

regards,
dan carpenter
