From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Apr 2016 22:25:51 +0000
Subject: Re: [patch] gpio: brcmstb: missing error code
Message-Id: <20160415222551.GL4247@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160415144528.GC8953@mwanda>
 <57116564.4000002@gmail.com>
In-Reply-To: <57116564.4000002@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Brian Norris <computersforpeace@gmail.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Apr 15, 2016 at 03:04:20PM -0700, Florian Fainelli wrote:
> On 15/04/16 07:45, Dan Carpenter wrote:
> > We should set the error code before returning here.  Otherwise "err"
> > could be uninitialized or zero.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Axel just sent an identical patch which Linus picked already:
> 
> http://www.spinics.net/lists/linux-gpio/msg13728.html

Heh.  Weird timing.  That bug has been there for 11 months...

regards,
dan carpenter

