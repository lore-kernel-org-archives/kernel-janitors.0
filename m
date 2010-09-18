From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sat, 18 Sep 2010 11:21:50 +0000
Subject: Re: [PATCH] gpio: stmpe: fix error path
Message-Id: <20100918112150.GA3351@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284317840-5131-1-git-send-email-segooon@gmail.com>
 <20100913193728.GA14993@pengutronix.de>
In-Reply-To: <20100913193728.GA14993@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: kernel-janitors@vger.kernel.org, Rabin Vincent <rabin.vincent@stericsson.com>, Samuel Ortiz <sameo@linux.intel.com>, Luotao Fu <l.fu@pengutronix.de>, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org

On Mon, Sep 13, 2010 at 21:37 +0200, Wolfram Sang wrote:
> On Sun, Sep 12, 2010 at 10:57:19PM +0400, Vasiliy Kulikov wrote:
> > Free allocated memory.  Call stmpe_disable() if it was enabled.
> > 
> > Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> > ---
> >  Compile tested.
> >  Maybe It needs better error path.
> 
> What do you mean here? Looks good to me so far.

Forget it, I was wrong ;)


-- 
Vasiliy
