From: Joel Stanley <joel@jms.id.au>
Date: Wed, 23 Oct 2019 06:23:53 +0000
Subject: Re: [PATCH] EDAC: Aspeed: Use devm_platform_ioremap_resource() in aspeed_probe()
Message-Id: <CACPK8XfUJ5VGpTS3gwxSVZbdWZKPH6PwT2JKGGJ2yzoXYKdtZg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <baabb9e9-a1b2-3a04-9fb6-aa632de5f722@web.de>
In-Reply-To: <baabb9e9-a1b2-3a04-9fb6-aa632de5f722@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Tony Luck <tony.luck@intel.com>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Robert Richter <rrichter@marvell.com>, James Morse <james.morse@arm.com>, Stefan Schaeckeler <sschaeck@cisco.com>, Borislav Petkov <bp@alien8.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org

On Sat, 21 Sep 2019 at 16:47, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 21 Sep 2019 18:32:46 +0200
>
> Simplify this function implementation by using a known wrapper function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Joel Stanley <joel@jms.id.au>
