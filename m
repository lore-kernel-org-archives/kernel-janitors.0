From: "Vatsavayi, Raghu" <Raghu.Vatsavayi@cavium.com>
Date: Wed, 30 Nov 2016 19:02:09 +0000
Subject: RE: [bug report] Add support of Cavium Liquidio ethernet adapters
Message-Id: <DM3PR07MB2138BCC7588FC6422EADFD7B818C0@DM3PR07MB2138.namprd07.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161130185754.GA8645@mwanda>
In-Reply-To: <20161130185754.GA8645@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Please see inline:

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Wednesday, November 30, 2016 10:58 AM
> To: Vatsavayi, Raghu
> Cc: kernel-janitors@vger.kernel.org; Goutham, Sunil
> Subject: [bug report] Add support of Cavium Liquidio ethernet adapters
> 
> Hello Raghu Vatsavayi,
> 
> The patch f21fb3ed364b: "Add support of Cavium Liquidio ethernet
> adapters" from Jun 9, 2015, leads to the following static checker
> warning:
> 
> 	drivers/net/ethernet/cavium/liquidio/lio_main.c:1013
> liquidio_schedule_droq_pkt_handlers()
> 	warn: potential left shift more than type allows '0-63'
> 
> drivers/net/ethernet/cavium/liquidio/lio_main.c
>    996  static void liquidio_schedule_droq_pkt_handlers(struct octeon_device
> *oct)
>    997  {
>    998          struct octeon_device_priv *oct_priv =
>    999                  (struct octeon_device_priv *)oct->priv;
>   1000          u64 oq_no;
> 
> This should probably be int.  Making it u64 doesn't do anything.
> 
>   1001          struct octeon_droq *droq;
>   1002
>   1003          if (oct->int_status & OCT_DEV_INTR_PKT_DATA) {
>   1004                  for (oq_no = 0; oq_no <
> MAX_OCTEON_OUTPUT_QUEUES(oct);
>                                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ This is either
> 32 or 64.
> 
> 
>   1005                       oq_no++) {
>   1006                          if (!(oct->droq_intr & BIT_ULL(oq_no)))
>   1007                                  continue;
>   1008
>   1009                          droq = oct->droq[oq_no];
>   1010
>   1011                          if (droq->ops.poll_mode) {
>   1012                                  droq->ops.napi_fn(droq);
>   1013                                  oct_priv->napi_mask |= (1 << oq_no);
> 
> It should be 1ULL << oq_no.  But the other bug is tahte ->napi_mask is a long
> but that will break on 32 bit systems when
> MAX_OCTEON_OUTPUT_QUEUES() is 64.  Is that a possible combination?
> 

[Raghu]: These drivers are for 64 bit systems as mentioned in Kconfig.

>   1014                          } else {
>   1015                                  tasklet_schedule(&oct_priv->droq_tasklet);
>   1016                          }
>   1017                  }
>   1018          }
>   1019  }
> 
> 
> regards,
> dan carpenter
