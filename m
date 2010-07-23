From: Dan Carpenter <error27@gmail.com>
Date: Fri, 23 Jul 2010 12:00:23 +0000
Subject: Re: [patch -next] V4L: ivtv: remove unneeded NULL checks
Message-Id: <20100723120023.GI26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100723101232.GE26313@bicker> <1279885607.2013.8.camel@morgan.silverblock.net>
In-Reply-To: <1279885607.2013.8.camel@morgan.silverblock.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Walls <awalls@md.metrocast.net>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Ian Armstrong <ian@iarmst.demon.co.uk>, ivtv-devel@ivtvdriver.org, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jul 23, 2010 at 07:46:47AM -0400, Andy Walls wrote:
> On Fri, 2010-07-23 at 12:12 +0200, Dan Carpenter wrote:
> > In ivtvfb_callback_cleanup() we dereference "itv" before checking that
> > it's NULL.  "itv" is assigned with container_of() which basically never
> > returns a NULL pointer so the check is pointless.  I removed it, along
> > with a similar check in ivtvfb_callback_init().
> > 
> > I considered adding a check for v4l2_dev, but I looked at the code and I
> > don't think that can be NULL either.
> > 
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> Hi Dan,
> 
> Thanks, but Jiri Slaby already caught this one:
> 
> https://patchwork.kernel.org/patch/112725/
> 
> I'm going to let Mauro pick up Jiri's patch out of patchwork.
> 

Wow.  It's remarkable how similar they are even down to the change log.

regards,
dan carpenter


