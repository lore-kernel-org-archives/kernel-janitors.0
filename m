From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2016 11:05:02 +0000
Subject: [bug report] cxgb4: add common api support for configuring filters
Message-Id: <20161124110502.GD17225@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Rahul Lakkireddy,

The patch 578b46b9383c: "cxgb4: add common api support for
configuring filters" from Sep 20, 2016, leads to the following static
checker warning:

	drivers/net/ethernet/chelsio/cxgb4/cxgb4_filter.c:537 __cxgb4_set_filter()
	warn: we tested 'f->valid' before and it was 'false'

drivers/net/ethernet/chelsio/cxgb4/cxgb4_filter.c
   512          /* Check to make sure that provided filter index is not
   513           * already in use by someone else
   514           */
   515          f = &adapter->tids.ftid_tab[filter_id];
   516          if (f->valid)
   517                  return -EBUSY;

If valid is set, then we return -EBUSY.

   518  
   519          fidx = filter_id + adapter->tids.ftid_base;
   520          ret = cxgb4_set_ftid(&adapter->tids, filter_id,
   521                               fs->type ? PF_INET6 : PF_INET);
   522          if (ret)
   523                  return ret;
   524  
   525          /* Check to make sure the filter requested is writable ... */
   526          ret = writable_filter(f);
   527          if (ret) {
   528                  /* Clear the bits we have set above */
   529                  cxgb4_clear_ftid(&adapter->tids, filter_id,
   530                                   fs->type ? PF_INET6 : PF_INET);
   531                  return ret;
   532          }
   533  
   534          /* Clear out any old resources being used by the filter before
   535           * we start constructing the new filter.
   536           */
   537          if (f->valid)
   538                  clear_filter(adapter, f);

So probably these lines can be removed?

   539  
   540          /* Convert the filter specification into our internal format.
   541           * We copy the PF/VF specification into the Outer VLAN field
   542           * here so the rest of the code -- including the interface to
   543           * the firmware -- doesn't have to constantly do these checks.
   544           */

regards,
dan carpenter
