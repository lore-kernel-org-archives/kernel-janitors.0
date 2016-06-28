From: walter harms <wharms@bfs.de>
Date: Tue, 28 Jun 2016 09:05:17 +0000
Subject: Re: qede: Add support for coalescing config read/update.
Message-Id: <57723DCD.5020904@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160627194210.GA30526@mwanda>
In-Reply-To: <20160627194210.GA30526@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 28.06.2016 09:26, schrieb Yuval Mintz:
>>> drivers/net/ethernet/qlogic/qede/qede_ethtool.c
>>>    429  static int qede_get_coalesce(struct net_device *dev,
>>>    430                               struct ethtool_coalesce *coal)
>>>    431  {
>>>    432          struct qede_dev *edev = netdev_priv(dev);
>>>    433
>>>    434          memset(coal, 0, sizeof(struct ethtool_coalesce));
>>>    435          edev->ops->common->get_coalesce(edev->cdev,
>>>    436                                          (u16 *)&coal->rx_coalesce_usecs,
>>>    437                                          (u16 *)&coal->tx_coalesce_usecs);
>>>
>>> This won't work on big endian systems.  Fix it so the function takes a
>>> u32 or make ->rx_coalesce_usecs a u16.
>>>
>> given you do a memset before, what are the chances that coal-
>>> rx_coalesce_usecs != 0 ?
>> Is there a dynamic update in the background ?
> 
> It's a getter; The entire purpose of the `get_coalesce' function is to fill
> those fields with actual values.
> [Although I noticed that the memset is clearing the `cmd' field,
> which isn't an intended result]
> 

ok i understand, wrong direction :)
re,
 wh
