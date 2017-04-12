From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Apr 2017 08:34:34 +0000
Subject: [bug report] wimax/i2400m: support extended data RX protocol (no need to reallocate skbs)
Message-Id: <20170412083434.GE3250@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Inaky Perez-Gonzalez,

The patch fd5c565c0c04: "wimax/i2400m: support extended data RX
protocol (no need to reallocate skbs)" from Feb 28, 2009, leads to
the following static checker warning:

	drivers/net/wimax/i2400m/netdev.c:565 i2400m_net_erx()
	error: dereferencing freed memory 'skb'

drivers/net/wimax/i2400m/netdev.c
   533  void i2400m_net_erx(struct i2400m *i2400m, struct sk_buff *skb,
   534                      enum i2400m_cs cs)
   535  {
   536          struct net_device *net_dev = i2400m->wimax_dev.net_dev;
   537          struct device *dev = i2400m_dev(i2400m);
   538          int protocol;
   539  
   540          d_fnstart(2, dev, "(i2400m %p skb %p [%u] cs %d)\n",
   541                    i2400m, skb, skb->len, cs);
   542          switch(cs) {
   543          case I2400M_CS_IPV4_0:
   544          case I2400M_CS_IPV4:
   545                  protocol = ETH_P_IP;
   546                  i2400m_rx_fake_eth_header(i2400m->wimax_dev.net_dev,
   547                                            skb->data - ETH_HLEN,
   548                                            cpu_to_be16(ETH_P_IP));
   549                  skb_set_mac_header(skb, -ETH_HLEN);
   550                  skb->dev = i2400m->wimax_dev.net_dev;
   551                  skb->protocol = htons(ETH_P_IP);
   552                  net_dev->stats.rx_packets++;
   553                  net_dev->stats.rx_bytes += skb->len;
   554                  break;
   555          default:
   556                  dev_err(dev, "ERX: BUG? CS type %u unsupported\n", cs);
   557                  goto error;
                        ^^^^^^^^^^
Is this a leak?

   558  
   559          }
   560          d_printf(3, dev, "ERX: receiving %d bytes to the network stack\n",
   561                   skb->len);
   562          d_dump(4, dev, skb->data, skb->len);
   563          netif_rx_ni(skb);       /* see notes in function header */
                            ^^^
Does this free "skb"?

   564  error:
   565          d_fnend(2, dev, "(i2400m %p skb %p [%u] cs %d) = void\n",
   566                  i2400m, skb, skb->len, cs);
                                     ^^^^^^^^
This is probably a use after free right?

   567  }

regards,
dan carpenter
