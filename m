From: Tony Lindgren <tony@atomide.com>
Date: Mon, 26 Aug 2019 16:20:50 +0000
Subject: Re: [PATCH] ARM: OMAP2+: Delete an unnecessary kfree() call in omap_hsmmc_pdata_init()
Message-Id: <20190826162050.GX52127@atomide.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <69025c8c-8d84-6686-138b-cde59467b802@web.de>
In-Reply-To: <69025c8c-8d84-6686-138b-cde59467b802@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Paul Walmsley <paul@pwsan.com>, Balaji T K <balajitk@ti.com>, Kishore Kadiyala <kishore.kadiyala@ti.com>, kernel-janitors@vger.kernel.org, Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Benoit Cousson <b-cousson@ti.com>

* Markus Elfring <Markus.Elfring@web.de> [190826 06:31]:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 26 Aug 2019 15:05:31 +0200
> 
> A null pointer would be passed to a call of the function "kfree" directly
> after a call of the function "kzalloc" failed at one place.
> Remove this superfluous function call.
> 
> This issue was detected by using the Coccinelle software.

Applying into omap-for-v5.4/soc thanks.

Tony
