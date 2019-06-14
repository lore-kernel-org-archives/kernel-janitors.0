From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 14 Jun 2019 15:32:25 +0000
Subject: Re: [PATCH] drivers: Provide devm_platform_ioremap_resource_byname()
Message-Id: <20190614153225.GE18049@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <39e46643-d799-94b7-4aa5-d6d99d738f99@web.de>
 <20190614133840.GN9224@smile.fi.intel.com>
 <20190614141004.GC7234@kroah.com>
 <20190614144706.GO9224@smile.fi.intel.com>
In-Reply-To: <20190614144706.GO9224@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, Jack Ping CHNG <jack.ping.chng@linux.intel.com>, kernel-janitors@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Enrico Weigelt <lkml@metux.net>, Himanshu Jha <himanshujha199640@gmail.com>, Linus Walleij <linus.walleij@linaro.org>

On Fri, Jun 14, 2019 at 05:47:06PM +0300, Andy Shevchenko wrote:
> On Fri, Jun 14, 2019 at 04:10:04PM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Jun 14, 2019 at 04:38:40PM +0300, Andy Shevchenko wrote:
> > > +Cc: Jack Ping, who did internally the same
> > > 
> > > On Fri, Jun 14, 2019 at 03:26:25PM +0200, Markus Elfring wrote:
> > > > From: Markus Elfring <elfring@users.sourceforge.net>
> > > > Date: Fri, 14 Jun 2019 15:15:14 +0200
> > > > 
> > > > The functions “platform_get_resource_byname” and “devm_ioremap_resource”
> > > > are called together in 181 source files.
> > > > This implementation detail can be determined also with the help
> > > > of the semantic patch language (Coccinelle software).
> > > > 
> > > > Wrap these two calls into another helper function.
> > > > Thus a local variable does not need to be declared for a resource
> > > > structure pointer before and a redundant argument can be omitted
> > > > for the resource type.
> > > 
> > > This one makes sense.
> > > Though I'm not sure Greg will see your message.
> > 
> > Nope, didn't see it, don't want to see it, it will only cause more work
> > in the longrun...
> > 
> > > Rafael, maybe you can apply this one?
> > 
> > Um, don't go around maintainers please, that's rude.  
> 
> I won't do it, how should we proceed if de facto this functionality is good to
> have besides the fact of coming new user in the future?
> 
> > There is a reason
> > this specific developer is in my blacklist, and perhaps they should be
> > in yours as well :)
> 
> Perhaps.
> 
> > I don't like adding new apis with no user.
> 
> Perhaps Jack Ping will send it as a first patch of his series where he utilizes
> this functionality. Would it be acceptable?

Yes, that would be ok.

thanks,

greg k-h
