From: Dan Carpenter <error27@gmail.com>
Date: Sat, 13 Feb 2010 10:06:16 +0000
Subject: Re: [patch] staging: vt6655: rewrite CARDvUpdateBasicTopRate()
Message-Id: <20100213100616.GK14210@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100213080317.GJ14210@bicker>
In-Reply-To: <20100213080317.GJ14210@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Feb 13, 2010 at 10:44:53AM +0100, Jiri Slaby wrote:
> On 02/13/2010 10:36 AM, Jiri Slaby wrote:
> > You cannot use ffs and fls here.
> 
> Actually you can (fls), if you add proper masks there like
> fls(pDevice->wBasicRate & ((1 << RATE_24M) - 1) & ~((1 << RATE_6M) -
> 1)), but with some macro-ification inside. Dunno if it gets better though.
> 

Ok.  I didn't understand how ffs() and fls() worked before.  Sorry about that.

Let's just apply my original patch because that is an obvious one.

If I could test my changes, I would feel more comfortable rewriting stuff
but I don't have the hardware.

regards,
dan carpenter

> -- 
> js


