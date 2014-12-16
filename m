From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 16 Dec 2014 09:28:05 +0000
Subject: re: tun: add VNET_LE flag
Message-Id: <20141216092805.GA2937@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Michael S. Tsirkin,

The patch e999d6ea2a4f: "tun: add VNET_LE flag" from Nov 18, 2014,
leads to the following static checker warning:

	drivers/net/tun.c:1694 tun_set_iff()
	warn: 0x17100 is larger than 16 bits

drivers/net/tun.c
  1692  
  1693          tun->flags = (tun->flags & ~TUN_FEATURES) |
  1694                  (ifr->ifr_flags & TUN_FEATURES);
  1695  

It's complaining because the "ifr->ifr_flags" variable is a short
(should it be unsigned?).  The new define:

#define IFF_VNET_LE    0x10000

doesn't fit in two bytes.  Other suspect looking code could be:

	return __virtio16_to_cpu(q->flags & IFF_VNET_LE, val);

regards,
dan carpenter
