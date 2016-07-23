From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Date: Sat, 23 Jul 2016 12:18:57 +0000
Subject: Re: PM-wakeup: Delete unnecessary checks before two function calls
Message-Id: <1722549.jyvuK0dZRm@vostro.rjw.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <5786434.e97HVzPjpI@vostro.rjw.lan> <b243d2ba-a359-998d-1dd8-43ff444074a8@users.sourceforge.net>
In-Reply-To: <b243d2ba-a359-998d-1dd8-43ff444074a8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Saturday, July 23, 2016 07:32:22 AM SF Markus Elfring wrote:
> >> How do you think about to integrate this update suggestion
> >> into another source code repository?
> > 
> > I'm not really sure what you mean.
> 
> Do you find the suggested source code change acceptable?
> 
> http://article.gmane.org/gmane.linux.power-management.general/61766
> https://lkml.org/lkml/2015/6/28/21

Yes, it is acceptable, but you also should remove some braces that
aren't necessary any more.

Thanks,
Rafael

