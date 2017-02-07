From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2017 10:33:31 +0000
Subject: Re: [bug report] mlxsw: core: Introduce flexible actions support
Message-Id: <20170207102532.GH11103@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207071805.GA15533@mwanda>
In-Reply-To: <20170207071805.GA15533@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Feb 07, 2017 at 10:18:06AM +0300, Dan Carpenter wrote:
> Hello Jiri Pirko,
> 
> The patch 4cda7d8d7098: "mlxsw: core: Introduce flexible actions
> support" from Feb 3, 2017, leads to the following static checker
> warning:
> 
> 	drivers/net/ethernet/mellanox/mlxsw/core_acl_flex_actions.c:387 mlxsw_afa_block_commit()
> 	error: dereferencing freed memory 'set'
> 
> drivers/net/ethernet/mellanox/mlxsw/core_acl_flex_actions.c
>    355  int mlxsw_afa_block_commit(struct mlxsw_afa_block *block)
>    356  {
>    357          struct mlxsw_afa_set *set = block->cur_set;
>    358          struct mlxsw_afa_set *prev_set;
>    359          int err;
>    360  
>    361          block->cur_set = NULL;
>    362  
>    363          /* Go over all linked sets starting from last
>    364           * and try to find existing set in the hash table.
>    365           * In case it is not there, assign a KVD linear index
>    366           * and insert it.
>    367           */
>    368          do {
>    369                  prev_set = set->prev;
>    370                  set = mlxsw_afa_set_get(block->afa, set);
>    371                  if (IS_ERR(set)) {
>    372                          err = PTR_ERR(set);

Oh...  Also it can be an error pointer on this path.

>    373                          goto rollback;
>    374                  }
>    375                  if (prev_set) {
>    376                          prev_set->next = set;
>    377                          mlxsw_afa_set_next_set(prev_set, set->kvdl_index);
>    378                          set = prev_set;
>    379                  }
>    380          } while (prev_set);
>    381  
>    382          block->first_set = set;
>    383          block->finished = true;
>    384          return 0;
>    385  
>    386  rollback:
>    387          while ((set = set->next))
                          ^^^^^^^^^^^^^^^

That means this dereference will oops.

regards,
dan carpenter


>    388                  mlxsw_afa_set_put(block->afa, set);
> 
> "set" is refcounted.  The heuristic I'm using assumes that if it's
> refcounted with an atomic type then ignore the possibility that
> mlxsw_afa_set_put() will free "set".  This works very well generally
> and this is only the second time I've seen it fail because we're using
> regular types for refcounting.
> 
> It's possible that we know that we're holding multiple references to
> "set" so it will never be freed, but I normally don't feel bad sending
> false positive warnings if the code is very recent so here we are.  :)
> 
>    389          return err;
>    390  }
> 
> regards,
> dan carpenter
