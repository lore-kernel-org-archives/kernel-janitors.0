From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Jan 2020 14:37:12 +0000
Subject: [bug report] netdevsim: fib: Add dummy implementation for FIB offload
Message-Id: <20200120143712.wzgjjpwuvrtbioef@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Ido Schimmel,

The patch 48bb9eb47b27: "netdevsim: fib: Add dummy implementation for
FIB offload" from Jan 14, 2020, leads to the following static checker
warning:

	drivers/net/netdevsim/fib.c:663 nsim_fib6_rt_insert()
	error: 'fib6_rt' dereferencing possible ERR_PTR()

drivers/net/netdevsim/fib.c
   460  nsim_fib6_rt_create(struct nsim_fib_data *data,
   461                      struct fib6_entry_notifier_info *fen6_info)
   462  {
   463          struct fib6_info *iter, *rt = fen6_info->rt;
   464          struct nsim_fib6_rt *fib6_rt;
   465          int i = 0;
   466          int err;
   467  
   468          fib6_rt = kzalloc(sizeof(*fib6_rt), GFP_ATOMIC);
   469          if (!fib6_rt)
   470                  return NULL;
                        ^^^^^^^^^^^

   471  
   472          nsim_fib_rt_init(data, &fib6_rt->common, &rt->fib6_dst.addr,
   473                           sizeof(rt->fib6_dst.addr), rt->fib6_dst.plen, AF_INET6,
   474                           rt->fib6_table->tb6_id);
   475  
   476          /* We consider a multipath IPv6 route as one entry, but it can be made
   477           * up from several fib6_info structs (one for each nexthop), so we
   478           * add them all to the same list under the entry.
   479           */
   480          INIT_LIST_HEAD(&fib6_rt->nh_list);
   481  
   482          err = nsim_fib6_rt_nh_add(fib6_rt, rt);
   483          if (err)
   484                  goto err_fib_rt_fini;
   485  
   486          if (!fen6_info->nsiblings)
   487                  return fib6_rt;
   488  
   489          list_for_each_entry(iter, &rt->fib6_siblings, fib6_siblings) {
   490                  if (i = fen6_info->nsiblings)
   491                          break;
   492  
   493                  err = nsim_fib6_rt_nh_add(fib6_rt, iter);
   494                  if (err)
   495                          goto err_fib6_rt_nh_del;
   496                  i++;
   497          }
   498          WARN_ON_ONCE(i != fen6_info->nsiblings);
   499  
   500          return fib6_rt;
   501  
   502  err_fib6_rt_nh_del:
   503          list_for_each_entry_continue_reverse(iter, &rt->fib6_siblings,
   504                                               fib6_siblings)
   505                  nsim_fib6_rt_nh_del(fib6_rt, iter);
   506          nsim_fib6_rt_nh_del(fib6_rt, rt);
   507  err_fib_rt_fini:
   508          nsim_fib_rt_fini(&fib6_rt->common);
   509          kfree(fib6_rt);
   510          return ERR_PTR(err);
                       ^^^^^^^^^^^^
   511  }

This function should either return NULL or error pointers but not both.

When a function returns a mix of error pointers and NULL, the NULL case
should be a special kind of success.  For example, we request a feature
like debugfs but it's disabled.  That's not an error, but we also can't
return a valid pointer to the debug fs file.

regards,
dan carpenter
