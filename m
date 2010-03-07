From: David Miller <davem@davemloft.net>
Date: Sun, 07 Mar 2010 23:28:05 +0000
Subject: Re: [patch] ems_usb: cleanup: remove uneeded check
Message-Id: <20100307.152805.244203159.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100306111138.GH4958@bicker>
In-Reply-To: <20100306111138.GH4958@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: urs.thuermann@volkswagen.de, oliver.hartkopp@volkswagen.de, wg@grandegger.com, haas@ems-wuensche.com, kurt.van.dijck@eia.be, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Sat, 6 Mar 2010 14:11:38 +0300

> "skb" is alway non-null here, but even if it were null the check isn't
> needed because dev_kfree_skb() can handle it.
> 
> This eliminates a smatch warning about dereferencing a variable before
> checking that it is non-null.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
