From: "fugang.duan@freescale.com" <fugang.duan@freescale.com>
Date: Tue, 16 Sep 2014 10:16:55 +0000
Subject: RE: net: fec: change data structure to support multiqueue
Message-Id: <e849c49814f7496492ee8ca886d0d312@BLUPR03MB373.namprd03.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140916093935.GA24540@mwanda>
In-Reply-To: <20140916093935.GA24540@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com> Sent: Tuesday, September 16, 2014 5:40 PM
>To: Duan Fugang-B38611
>Cc: Duan Fugang-B38611; kernel-janitors@vger.kernel.org
>Subject: re: net: fec: change data structure to support multiqueue
>
>Hello Fugang Duan,
>
>The patch 4d494cdc92b3: "net: fec: change data structure to support
>multiqueue" from Sep 13, 2014, leads to the following static checker
>warning:
>
>	drivers/net/ethernet/freescale/fec_main.c:1418 fec_enet_rx_queue()
>	warn: add curly braces? (if)
>
>drivers/net/ethernet/freescale/fec_main.c
>  1413
>  1414                          /* Extract the frame data without the VLAN
>header. */
>  1415                          skb_copy_to_linear_data(skb, data, (2 *
>ETH_ALEN));
>  1416                          if (vlan_packet_rcvd)
>  1417                                  payload_offset = (2 * ETH_ALEN) +
>VLAN_HLEN;
>  1418                                  skb_copy_to_linear_data_offset(skb,
>(2 * ETH_ALEN),
>  1419                                                         data +
>payload_offset,
>  1420                                                         pkt_len - 4
>- (2 * ETH_ALEN));
>
>The patch pushed this call to skb_copy_to_linear_data_offset() in one
>indent level but didn't add curly braces.  It's not clear to me if the
>indenting was intentional or not.
>
>  1421
>  1422                          skb->protocol = eth_type_trans(skb, ndev);
>  1423
>
>regards,
>dan carpenter

Hi, Dan,

Thanks for your point out the issue, I will submit one patch to fix it.
It just indent issue.

Thanks,
Andy
