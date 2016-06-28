From: walter harms <wharms@bfs.de>
Date: Tue, 28 Jun 2016 07:17:10 +0000
Subject: Re: qede: Add support for coalescing config read/update.
Message-Id: <57722476.2010807@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160627194210.GA30526@mwanda>
In-Reply-To: <20160627194210.GA30526@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 28.06.2016 06:41, schrieb Sudarsana Kalluru:
> Hi Dan carpenter,
>     Thanks for your mail. Will address it.
> 
> Thanks,
> Sudarsana
> 
> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com] 
> Sent: 28 June 2016 01:12
> To: Sudarsana Kalluru <Sudarsana.Kalluru@qlogic.com>
> Cc: kernel-janitors@vger.kernel.org
> Subject: re: qede: Add support for coalescing config read/update.
> 
> Hello Sudarsana Reddy Kalluru,
> 
> The patch d552fa84cb35: "qede: Add support for coalescing config read/update." from Jun 21, 2016, leads to the following static checker warning:
> 
> 	drivers/net/ethernet/qlogic/qede/qede_ethtool.c:435 qede_get_coalesce()
> 	warn: passing casted pointer '&coal->rx_coalesce_usecs' to 'edev->ops->common->get_coalesce()' 32 vs 16.
> 
> drivers/net/ethernet/qlogic/qede/qede_ethtool.c
>    429  static int qede_get_coalesce(struct net_device *dev,
>    430                               struct ethtool_coalesce *coal)
>    431  {
>    432          struct qede_dev *edev = netdev_priv(dev);
>    433  
>    434          memset(coal, 0, sizeof(struct ethtool_coalesce));
>    435          edev->ops->common->get_coalesce(edev->cdev,
>    436                                          (u16 *)&coal->rx_coalesce_usecs,
>    437                                          (u16 *)&coal->tx_coalesce_usecs);
> 
> This won't work on big endian systems.  Fix it so the function takes a
> u32 or make ->rx_coalesce_usecs a u16.
> 
given you do a memset before, what are the chances that coal->rx_coalesce_usecs != 0 ?
Is there a dynamic update in the background ?
re,
 wh


>    438  
>    439          return 0;
>    440  }
> 
> regards,
> dan carpenter
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
