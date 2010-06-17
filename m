From: Dan Carpenter <error27@gmail.com>
Date: Thu, 17 Jun 2010 19:21:23 +0000
Subject: Re: [PATCH] staging/wlags49_h2: Fix build error when CONFIG_SYSFS
Message-Id: <20100617192123.GC29824@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1276751864.14632.6.camel@lenovo>
In-Reply-To: <1276751864.14632.6.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jun 17, 2010 at 07:23:32PM +0200, Henk de Groot wrote:
> Javier,
>
> I assumed Greg KH already added this last version of your patch to the  
> queue for the staging tree. Anyway I think it's fine. The only problem I  
> see is a possible complained from the compiler because of an argument  
> that's defined but never used.

Gcc never complains about arguments that aren't used.  You often need to
do this so that your function matches how a function pointer is defined.

I also tested this.  To disable CONFIG_SYSFS do a "make allnoconfig"
then enable CONFIG_EMBEDDED, then you can disable CONFIG_SYSFS.  It's
deliberately a pain in the arse I suppose.

It's not a huge deal to have a #define either, but Joe Perches is right
that the current fix really is the better one.

regards,
dan carpenter

