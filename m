From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 May 2018 12:05:31 +0000
Subject: [bug report] net: Introduce net_failover driver
Message-Id: <20180531120530.ipjzygddpptebqnu@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Sridhar Samudrala,

The patch cfc80d9a1163: "net: Introduce net_failover driver" from May
24, 2018, leads to the following static checker warning:

	drivers/net/net_failover.c:65 net_failover_open()
	error: we previously assumed 'primary_dev' could be null (see line 43)

drivers/net/net_failover.c
    36  static int net_failover_open(struct net_device *dev)
    37  {
    38          struct net_failover_info *nfo_info = netdev_priv(dev);
    39          struct net_device *primary_dev, *standby_dev;
    40          int err;
    41  
    42          primary_dev = rtnl_dereference(nfo_info->primary_dev);
    43          if (primary_dev) {
    44                  err = dev_open(primary_dev);
    45                  if (err)
    46                          goto err_primary_open;
    47          }
    48  
    49          standby_dev = rtnl_dereference(nfo_info->standby_dev);
    50          if (standby_dev) {
    51                  err = dev_open(standby_dev);
    52                  if (err)
    53                          goto err_standby_open;
    54          }
    55  
    56          if ((primary_dev && net_failover_xmit_ready(primary_dev)) ||
    57              (standby_dev && net_failover_xmit_ready(standby_dev))) {
    58                  netif_carrier_on(dev);
    59                  netif_tx_wake_all_queues(dev);
    60          }
    61  
    62          return 0;
    63  
    64  err_standby_open:
    65          dev_close(primary_dev);

We need a NULL check here:

		if (primary_dev)
			dev_close(primary_dev);

    66  err_primary_open:
    67          netif_tx_disable(dev);

Is this really correct?  It feel like it's either wrong or a slightly
ugly layering violation.  We didn't call netif_tx_enable in this
function.

    68          return err;
    69  }


regards,
dan carpenter
