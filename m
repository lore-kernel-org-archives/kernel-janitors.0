From: David Miller <davem@davemloft.net>
Date: Wed, 18 Jun 2008 23:23:30 +0000
Subject: Re: [PATCH] firmware: convert tg3 driver to request_firmware()
Message-Id: <20080618.162330.88485757.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1213799313.4794.20.camel@fc6.satnam>
In-Reply-To: <1213799313.4794.20.camel@fc6.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 19 Jun 2008 00:15:56 +0100

> Solving that problem was step #1 in the process of converting drivers to
> use request_firmware(). You _have_ to be able to build the firmware into
> the kernel image, and you _can_.

Fair enough.

I'll step back and let you work out the objections Jeff
raised.
