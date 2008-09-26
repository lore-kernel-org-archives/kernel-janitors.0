From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 26 Sep 2008 14:45:54 +0000
Subject: Re: [PATCH] sound/soc/at32: Useless NULL test
Message-Id: <s5hej37artp.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200809261523.46747.brunel@diku.dk>
	<20080926140021.GD15493@sirena.org.uk>
In-Reply-To: <20080926140021.GD15493@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@sirena.org.uk>
Cc: Julien Brunel <brunel@diku.dk>, Geoffrey Wossum <geoffrey@pager.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

At Fri, 26 Sep 2008 15:00:23 +0100,
Mark Brown wrote:
> 
> On Fri, Sep 26, 2008 at 03:23:46PM +0200, Julien Brunel wrote:
> 
> > The test (ssc != NULL) can only be reached if the call to the function
> > ssc_request, the result of which ssc is assigned, succeeds. Moreover,
> > statements assign NULL to ssc just before a return, which is useless
> > since it is a local variable. So, we suggest to delete the test and
> > the two assignments.
> 
> Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

Applied now.  Thanks.

> For future reference if you're submitting other similar things (which I
> guess you will given that you've got a tool to check for this stuff)
> it'd be helpful if you could rewrite the explanation for the NULL test
> to be something like:
> 
>     The test (ssc != NULL) is redundant since it can only be reached
>     when ssc is guaranteed to have been set to a valid ssc.
> 
> which is much easier to parse.

Agreed :)


Takashi
