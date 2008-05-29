From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 29 May 2008 16:14:23 +0000
Subject: Re: [PATCH 2/2] Eliminate double kfree
Message-Id: <20080529121315.ZZRA012@mailhub.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0805291504400.26229@ask.diku.dk> <20080529101012.ZZRA012@mailhub.coreip.homeip.net> <Pine.LNX.4.64.0805291754480.26229@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0805291754480.26229@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 29, 2008 at 05:57:50PM +0200, Julia Lawall wrote:
> On Thu, 29 May 2008, Dmitry Torokhov wrote:
> 
> > Hi Julia,
> > 
> > On Thu, May 29, 2008 at 03:05:07PM +0200, Julia Lawall wrote:
> > > From: Julia Lawall <julia@diku.dk>
> > > 
> > > The variable report is only non-NULL and non-freed in a small region of
> > > code, so it should only be freed in error handling code that comes from
> > > that region.
> > > 
> > 
> > Thank you for your patch. There isn't a double-kfree though, as far
> > as I can see.
> 
> There was a double free because the error handling at the end of the 
> function (for input_register_device) would fall through to the 
> kfree(report) under err_free_devs, even though report is already freed at 
> that point.
> 

Ah, yes, indeed.. Well, that decides what branch the patch gets
applied then ;)

-- 
Dmitry
