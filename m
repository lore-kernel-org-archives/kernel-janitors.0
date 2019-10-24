From: Borislav Petkov <bp@alien8.de>
Date: Thu, 24 Oct 2019 13:45:11 +0000
Subject: Re: [PATCH] EDAC: Aspeed: Use devm_platform_ioremap_resource() in aspeed_probe()
Message-Id: <20191024134511.GA1942@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <baabb9e9-a1b2-3a04-9fb6-aa632de5f722@web.de>
 <CACPK8XfUJ5VGpTS3gwxSVZbdWZKPH6PwT2JKGGJ2yzoXYKdtZg@mail.gmail.com>
In-Reply-To: <CACPK8XfUJ5VGpTS3gwxSVZbdWZKPH6PwT2JKGGJ2yzoXYKdtZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Stanley <joel@jms.id.au>
Cc: Tony Luck <tony.luck@intel.com>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Robert Richter <rrichter@marvell.com>, James Morse <james.morse@arm.com>, Stefan Schaeckeler <sschaeck@cisco.com>, Markus Elfring <Markus.Elfring@web.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org

On Wed, Oct 23, 2019 at 06:23:53AM +0000, Joel Stanley wrote:
> On Sat, 21 Sep 2019 at 16:47, Markus Elfring <Markus.Elfring@web.de> wrote:
> >
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sat, 21 Sep 2019 18:32:46 +0200
> >
> > Simplify this function implementation by using a known wrapper function.
> >
> > This issue was detected by using the Coccinelle software.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> Acked-by: Joel Stanley <joel@jms.id.au>

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
