From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Aug 2015 15:39:21 +0000
Subject: re: Microchip's LAN7800 family USB 2/3 to 10/100/1000 Ethernet device driver
Message-Id: <20150803153921.GA13117@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Woojung.Huh@microchip.com,

This is a semi-automatic email about new static checker warnings.

The patch 55d7de9de6c3: "Microchip's LAN7800 family USB 2/3 to 
10/100/1000 Ethernet device driver" from Jul 30, 2015, leads to the 
following Smatch complaint:

drivers/net/usb/lan78xx.c:2282 tx_complete()
	 warn: variable dereferenced before check 'skb' (see line 2249)

drivers/net/usb/lan78xx.c
  2248		struct sk_buff *skb = (struct sk_buff *)urb->context;
  2249		struct skb_data *entry = (struct skb_data *)skb->cb;
                                                            ^^^^^^^
Dereference.

  2250		struct lan78xx_net *dev = entry->dev;
  2251	
  2252		if (urb->status = 0) {
  2253			dev->net->stats.tx_packets++;
  2254			dev->net->stats.tx_bytes += entry->length;
  2255		} else {
  2256			dev->net->stats.tx_errors++;
  2257	
  2258			switch (urb->status) {
  2259			case -EPIPE:
  2260				lan78xx_defer_kevent(dev, EVENT_TX_HALT);
  2261				break;
  2262	
  2263			/* software-driven interface shutdown */
  2264			case -ECONNRESET:
  2265			case -ESHUTDOWN:
  2266				break;
  2267	
  2268			case -EPROTO:
  2269			case -ETIME:
  2270			case -EILSEQ:
  2271				netif_stop_queue(dev->net);
  2272				break;
  2273			default:
  2274				netif_dbg(dev, tx_err, dev->net,
  2275					  "tx err %d\n", entry->urb->status);
  2276				break;
  2277			}
  2278		}
  2279	
  2280		usb_autopm_put_interface_async(dev->intf);
  2281	
  2282		if (skb)
                    ^^^
Check too late.

  2283			defer_bh(dev, skb, &dev->txq, tx_done);
  2284	}

regards,
dan carpenter
