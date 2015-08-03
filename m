From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Aug 2015 15:46:45 +0000
Subject: Re: Microchip's LAN7800 family USB 2/3 to 10/100/1000 Ethernet device driver
Message-Id: <20150803154645.GV5096@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150803153921.GA13117@mwanda>
In-Reply-To: <20150803153921.GA13117@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There are some other Smatch warnings as well:

drivers/net/usb/lan78xx.c:2302 lan78xx_start_xmit() error: we previously assumed 'skb' could be null (see line 2299)
skb is dereferenced inside the function call.

drivers/net/usb/lan78xx.c:2885 lan78xx_bh() info: ignoring unreachable code.
drivers/net/usb/lan78xx.c:3159 lan78xx_probe() info: ignoring unreachable code.

These are calls to BUG_ON().  You should just delete it, network
drivers shouldn't call BUG_ON(), at most they should call WARN_ON().

regards,
dan carpenter

