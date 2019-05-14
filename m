From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 May 2019 09:55:32 +0000
Subject: Re: [bug report] net: netcp: Add Keystone NetCP core ethernet driver
Message-Id: <20190514095531.GP16030@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190514094921.GA27527@mwanda>
In-Reply-To: <20190514094921.GA27527@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Oh crap, this is from 4 years ago.  Never mind.  I try to not send
emails for stuff that's over a couple years old but I didn't notice the
date here.

regards,
dan carpenter

On Tue, May 14, 2019 at 12:49:21PM +0300, Dan Carpenter wrote:
> Hello Karicheri, Muralidharan,
> 
> The patch 84640e27f230: "net: netcp: Add Keystone NetCP core ethernet
> driver" from Jan 15, 2015, leads to the following static checker
> warning:
> 
> 	drivers/net/ethernet/ti/netcp_core.c:1599 netcp_setup_navigator_resources()
> 	warn: passing zero to 'PTR_ERR'
> 
> drivers/net/ethernet/ti/netcp_core.c
>   1583  static int netcp_setup_navigator_resources(struct net_device *ndev)
>   1584  {
>   1585          struct netcp_intf *netcp = netdev_priv(ndev);
>   1586          struct knav_queue_notify_config notify_cfg;
>   1587          struct knav_dma_cfg config;
>   1588          u32 last_fdq = 0;
>   1589          u8 name[16];
>   1590          int ret;
>   1591          int i;
>   1592  
>   1593          /* Create Rx/Tx descriptor pools */
>   1594          snprintf(name, sizeof(name), "rx-pool-%s", ndev->name);
>   1595          netcp->rx_pool = knav_pool_create(name, netcp->rx_pool_size,
>   1596                                                  netcp->rx_pool_region_id);
>   1597          if (IS_ERR_OR_NULL(netcp->rx_pool)) {
>   1598                  dev_err(netcp->ndev_dev, "Couldn't create rx pool\n");
>   1599                  ret = PTR_ERR(netcp->rx_pool);
>   1600                  goto fail;
>   1601          }
>   1602  
>   1603          snprintf(name, sizeof(name), "tx-pool-%s", ndev->name);
>   1604          netcp->tx_pool = knav_pool_create(name, netcp->tx_pool_size,
>   1605                                                  netcp->tx_pool_region_id);
>   1606          if (IS_ERR_OR_NULL(netcp->tx_pool)) {
>                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Assume this is NULL.
> 
> When a function returns a mix of error pointers and NULL that means the
> the feature can be disabled.  Like an error pointer is straight forward,
> it means that something is broken.  But a NULL just means the feature is
> disabled so it's not an error but we also don't have a pointer to the
> feature because it doesn't exist.
> 
> In this case, how can the driver function without memory pools?  It
> doesn't make sense that the user should be able to disable it.
> 
>   1607                  dev_err(netcp->ndev_dev, "Couldn't create tx pool\n");
> 
> If it's not an error, we shouldn't print an error message.
> 
>   1608                  ret = PTR_ERR(netcp->tx_pool);
> 
> PTR_ERR(NULL) is zero/success.
> 
>   1609                  goto fail;
>   1610          }
>   1611  
> 
> This driver mentions ERR_PTR_OR_NULL() a lot but all the mentions I saw
> were wrong.  :(  I can't compile the driver myself or I would send a
> patch.
> 
> regards,
> dan carpenter
