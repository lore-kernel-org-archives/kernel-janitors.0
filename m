From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 26 Apr 2017 11:00:04 +0000
Subject: Re: reset: Use devm_kcalloc() in ti_syscon_reset_probe()?
Message-Id: <5a59a0ca-488a-8d19-2681-ff516c3622e6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e10a20a2-cfea-5b42-db3a-41b6eb08d7e4@users.sourceforge.net>
 <1493198391.3653.4.camel@pengutronix.de>
In-Reply-To: <1493198391.3653.4.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

> Thank you, I have applied this to the reset/next branch.

Thanks for your acceptance.


> The same change could be made in the ti-syscon reset driver.

I was unsure if a similar source code adjustments would be worthwhile there.
If you would like to be more strict with consistent usage of Linux functions
for array allocations, there are various further update candidates to consider.

Regards,
Markus
