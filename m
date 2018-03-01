From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 01 Mar 2018 09:52:16 +0000
Subject: [bug report] cxgb4: add common api support for configuring filters
Message-Id: <20180301095216.GA11704@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Rahul Lakkireddy,

The patch 578b46b9383c: "cxgb4: add common api support for
configuring filters" from Sep 20, 2016, leads to the following static
checker warning:

	drivers/net/ethernet/chelsio/cxgb4/cxgb4_filter.c:1341 __cxgb4_set_filter()
	warn: we tested 'f->valid' before and it was 'false'

drivers/net/ethernet/chelsio/cxgb4/cxgb4_filter.c
  1313  
  1314          /* Check to make sure that provided filter index is not
  1315           * already in use by someone else
  1316           */
  1317          f = &adapter->tids.ftid_tab[filter_id];
  1318          if (f->valid)
                    ^^^^^^^^
Checked.

  1319                  return -EBUSY;
  1320  
  1321          fidx = filter_id + adapter->tids.ftid_base;
  1322          ret = cxgb4_set_ftid(&adapter->tids, filter_id,
  1323                               fs->type ? PF_INET6 : PF_INET,
  1324                               chip_ver);
  1325          if (ret)
  1326                  return ret;
  1327  
  1328          /* Check t  make sure the filter requested is writable ... */
  1329          ret = writable_filter(f);
  1330          if (ret) {
  1331                  /* Clear the bits we have set above */
  1332                  cxgb4_clear_ftid(&adapter->tids, filter_id,
  1333                                   fs->type ? PF_INET6 : PF_INET,
  1334                                   chip_ver);
  1335                  return ret;
  1336          }
  1337  
  1338          /* Clear out any old resources being used by the filter before
  1339           * we start constructing the new filter.
  1340           */
  1341          if (f->valid)
                    ^^^^^^^^
I don't think this can be true.

  1342                  clear_filter(adapter, f);
  1343  

regards,
dan carpenter
