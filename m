From: Julia Lawall <julia@diku.dk>
Date: Tue, 15 Sep 2009 05:03:42 +0000
Subject: Re: [PATCH 1/8] arch/mips/txx9: introduce missing kfree, iounmap
Message-Id: <Pine.LNX.4.64.0909150701170.11392@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0909111820370.10552@pc-004.diku.dk>
 <20090913.232548.253168283.anemo@mba.ocn.ne.jp> <Pine.LNX.4.64.0909131708190.25903@ask.diku.dk>
 <20090914.003321.160496287.anemo@mba.ocn.ne.jp> <Pine.LNX.4.64.0909132113520.31000@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0909132113520.31000@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Cc: ralf@linux-mips.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> +out_pdev:
> +	platform_device_put(pdev);
> +out_gpio:
> +	gpio_remove(&iocled->chip);

I just noticed that the prototype of gpio_remove has __must_check
I don't think there is anything to check here; since the thing is not 
fully initialized here, it is unlikely to be busy.  Should there be (void) 
in front of it?

julia
