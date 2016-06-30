From: Lee Jones <lee.jones@linaro.org>
Date: Thu, 30 Jun 2016 20:59:37 +0000
Subject: Re: [PATCH] mfd: dm355evm_msp: Refactoring for add_child()
Message-Id: <20160630210010.GH1707@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05b7db2a-437a-60ac-d289-71d2150e7f5f@users.sourceforge.net>
 <de3598c4-f85a-6807-303a-55ee0ac707f2@users.sourceforge.net>
 <20160608111442.GB14888@dell>
 <e4eaf0b4-e539-b400-c8a2-70f210cee1fa@users.sourceforge.net>
 <75c1cc23-3a2d-db78-d0f2-b5934b18e828@users.sourceforge.net>
 <20160628150725.GL24982@dell>
 <c220895b-e56f-dc95-500d-0cf9d2f51777@users.sourceforge.net>
 <20160628163146.GG29166@dell>
 <69e96aa0-f3d9-d70d-c3ec-d39b5e9d9f14@users.sourceforge.net>
 <1467318883.24287.171.camel@perches.com>
In-Reply-To: <1467318883.24287.171.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Thu, 30 Jun 2016, Joe Perches wrote:

> On Thu, 2016-06-30 at 22:15 +0200, SF Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Thu, 30 Jun 2016 21:54:51 +0200
> > 
> > Adjust jump targets according to the Linux coding style convention.
> > Another check for the variable "status" can be omitted then at the
> > end.
> 
> Two headers in this email:
> 
> References: <566ABCD9.1060404@users.sourceforge.net> <5682D228.7070902@users.sourceforge.net> <20160111082922.GB14104@x1> <05b7db2a-437a-60ac-d289-71d2150e7f5f@users.sourceforge.net> <de3598c4-f85a-6807-303a-55ee0ac707f2@users.sourceforge.net> <20160608111442.GB14888@dell> <e4eaf0b4-e539-b400-c8a2-70f210cee1fa@users.sourceforge.net> <75c1cc23-3a2d-db78-d0f2-b5934b18e828@users.sourceforge.net> <20160628150725.GL24982@dell> <c220895b-e56f-dc95-500d-0cf9d2f51777@users.sourceforge.net> <20160628163146.GG29166@dell>
> In-reply-to: <20160628163146.GG29166@dell> 
> 
> Can you please fix your email client to _not_ send References:
> and In-reply-to: headers when sending new patches?  Thanks.
> 
> Even better would be to use git send-email for these patches.

Yes, I've mentioned this before.

I now have a gargantuan threaded mess consisting of 53 mails in my
inbox.  Please submit patches using `git send-email`, not forgetting
to increase your submission each time you submit i.e [PATCH v2] and
send them independently i.e. not attached to previous submissions.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
