From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Nov 2016 13:43:21 +0000
Subject: [bug report] ehea: Add 64bit statistics
Message-Id: <20161117134321.GA5096@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Anton Blanchard,

The patch 239c562c94dc: "ehea: Add 64bit statistics" from Oct 14,
2011, leads to the following static checker warning:

	drivers/net/ethernet/ibm/ehea/ehea_main.c:3047 ehea_setup_single_port()
	warn: struct type mismatch 'rtnl_link_stats64 vs net_device_stats'

drivers/net/ethernet/ibm/ehea/ehea_main.c
  3041          INIT_WORK(&port->reset_task, ehea_reset_port);
  3042          INIT_DELAYED_WORK(&port->stats_work, ehea_update_stats);
  3043  
  3044          init_waitqueue_head(&port->swqe_avail_wq);
  3045          init_waitqueue_head(&port->restart_wq);
  3046  
  3047          memset(&port->stats, 0, sizeof(struct net_device_stats));
                                               ^^^^^^^^^^^^^^^^^^^^^^^

This should be sizeof(struct rtnl_link_stats64).  But it's harmless,
the memory starts out as zeroed.  I don't have a cross compiler set up
so I'm not going to send a patch.

  3048          ret = register_netdev(dev);
  3049          if (ret) {
  3050                  pr_err("register_netdev failed. ret=%d\n", ret);
  3051                  goto out_unreg_port;
  3052          }

regards,
dan carpenter
