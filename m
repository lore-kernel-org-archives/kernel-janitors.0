From: David Miller <davem@davemloft.net>
Date: Wed, 18 Jun 2008 23:05:30 +0000
Subject: Re: [PATCH] firmware: convert tg3 driver to request_firmware()
Message-Id: <20080618.160530.180209734.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1213799313.4794.20.camel@fc6.satnam>
In-Reply-To: <1213799313.4794.20.camel@fc6.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 18 Jun 2008 23:49:54 +0100

> We believe they _are_ solved, so if you still see problems then
> please actually point them out rather than just spreading FUD.

Tell me this, how can I (with the default config option settings)
netboot properly without an initial ramdisk after these tg3 patches
and still get the proper firmware?
