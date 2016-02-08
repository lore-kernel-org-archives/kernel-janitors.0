From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 08 Feb 2016 21:08:11 +0000
Subject: [report] buffer overflow in capmode.c rx() function
Message-Id: <20160208210811.GA30822@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Here is the static checker warning.

	drivers/net/arcnet/capmode.c:78 rx()
	error: __memcpy() 'pktbuf + 4 +  + 4' too small (11 vs 15)

drivers/net/arcnet/capmode.c
    42  static void rx(struct net_device *dev, int bufnum,
    43                 struct archdr *pkthdr, int length)
    44  {
    45          struct arcnet_local *lp = netdev_priv(dev);
    46          struct sk_buff *skb;
    47          struct archdr *pkt = pkthdr;
                               ^^^^^^^^^^^^
Never used assignment.

    48          char *pktbuf, *pkthdrbuf;
    49          int ofs;
    50  
    51          arc_printk(D_DURING, dev, "it's a raw(cap) packet (length=%d)\n",
    52                     length);
    53  
    54          if (length >= MinTU)
    55                  ofs = 512 - length;
    56          else
    57                  ofs = 256 - length;
    58  
    59          skb = alloc_skb(length + ARC_HDR_SIZE + sizeof(int), GFP_ATOMIC);
    60          if (!skb) {
    61                  dev->stats.rx_dropped++;
    62                  return;
    63          }
    64          skb_put(skb, length + ARC_HDR_SIZE + sizeof(int));
    65          skb->dev = dev;
    66          skb_reset_mac_header(skb);
    67          pkt = (struct archdr *)skb_mac_header(skb);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Assigned here.

    68          skb_pull(skb, ARC_HDR_SIZE);
    69  
    70          /* up to sizeof(pkt->soft) has already been copied from the card
    71           * squeeze in an int for the cap encapsulation
    72           * use these variables to be sure we count in bytes, not in
    73           * sizeof(struct archdr)
    74           */
    75          pktbuf = (char *)pkt;
    76          pkthdrbuf = (char *)pkthdr;
    77          memcpy(pktbuf, pkthdrbuf, ARC_HDR_SIZE + sizeof(pkt->soft.cap.proto));
    78          memcpy(pktbuf + ARC_HDR_SIZE + sizeof(pkt->soft.cap.proto) + sizeof(int),
                                                                             ^^^^^^^^^^^

It looks like we break the memcpy into two peices so that we don't write
over this sizeof(int).


    79                 pkthdrbuf + ARC_HDR_SIZE + sizeof(pkt->soft.cap.proto),
    80                 sizeof(struct archdr) - ARC_HDR_SIZE - sizeof(pkt->soft.cap.proto));

But shouldn't the length value also say - sizeof(int)?  It looks like
we end up corrupting stack in the arcnet_rx() function.

    81  
    82          if (length > sizeof(pkt->soft))
    83                  lp->hw.copy_from_card(dev, bufnum, ofs + sizeof(pkt->soft),
    84                                        pkt->soft.raw + sizeof(pkt->soft)
    85                                        + sizeof(int),
    86                                        length - sizeof(pkt->soft));
    87  

regards,
dan carpenter
