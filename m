From: Salil Mehta <salil.mehta@huawei.com>
Date: Mon, 14 Aug 2017 10:31:21 +0000
Subject: RE: [bug report] net: hns3: Add support of HNS3 Ethernet Driver for hip08 SoC
Message-Id: <F4CC6FACFEB3C54C9141D49AD221F7F93B861577@FRAEML521-MBX.china.huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170810085832.qdje3ixuabavumao@mwanda>
In-Reply-To: <20170810085832.qdje3ixuabavumao@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Thursday, August 10, 2017 9:59 AM
> To: Salil Mehta
> Cc: kernel-janitors@vger.kernel.org
> Subject: [bug report] net: hns3: Add support of HNS3 Ethernet Driver
> for hip08 SoC
> 
> Hello Salil,
> 
> The patch 76ad4f0ee747: "net: hns3: Add support of HNS3 Ethernet
> Driver for hip08 SoC" from Aug 2, 2017, leads to the following static
> checker warning:
> 
> 	drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_enet.c:1059
> hns3_nic_get_stats64()
> 	error: uninitialized symbol 'start'.
> 
> drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_enet.c
>   1040  static void
>   1041  hns3_nic_get_stats64(struct net_device *netdev, struct
> rtnl_link_stats64 *stats)
>   1042  {
>   1043          struct hns3_nic_priv *priv = netdev_priv(netdev);
>   1044          int queue_num = priv->ae_handle->kinfo.num_tqps;
>   1045          struct hns3_enet_ring *ring;
>   1046          unsigned int start;
>                 ^^^^^^^^^^^^^^^^^^
>   1047          unsigned int idx;
>   1048          u64 tx_bytes = 0;
>   1049          u64 rx_bytes = 0;
>   1050          u64 tx_pkts = 0;
>   1051          u64 rx_pkts = 0;
>   1052
>   1053          for (idx = 0; idx < queue_num; idx++) {
>   1054                  /* fetch the tx stats */
>   1055                  ring = priv->ring_data[idx].ring;
>   1056                  do {
>   1057                          tx_bytes += ring->stats.tx_bytes;
>   1058                          tx_pkts += ring->stats.tx_pkts;
>   1059                  } while (u64_stats_fetch_retry_irq(&ring-
> >syncp, start));
> 
> ^^^^^
>   1060
>   1061                  /* fetch the rx stats */
>   1062                  ring = priv->ring_data[idx + queue_num].ring;
>   1063                  do {
>   1064                          rx_bytes += ring->stats.rx_bytes;
>   1065                          rx_pkts += ring->stats.rx_pkts;
>   1066                  } while (u64_stats_fetch_retry_irq(&ring-
> >syncp, start));
> 
> ^^^^^
> It's not clear what is intended here.
This is a bug and fetch_begin is missing. Idea, is to facilitate atomic
Fetch of 64 bit stats over 32-bit systems(this might not be true in our
64-bit SoC and has been put just for completeness). Above stats APIs
Beneath make use of seq locks and preemption disabling to achieve the
atomicity in fetching 64-bit stats over 32-bit system. This code will
be a NOOP on a 64-bit system. Perhaps, this is why it never got detected
while testing :( 

Reference: u64_stats_sync.h
[...]

For the readers, below is the usage suggested:
* do {
 *         start = u64_stats_fetch_begin(&stats->syncp);
 *         tbytes = stats->bytes64; // non atomic operation
 *         tpackets = stats->packets64; // non atomic operation
 * } while (u64_stats_fetch_retry(&stats->syncp, start));

" start = u64_stats_fetch_begin(&stats->syncp);" is missing in our code.
Will fix this anyways!

Thanks
Salil
> 
>   1067          }
>   1068
> 
> regards,
> dan carpenter
