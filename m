From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Aug 2016 20:12:20 +0000
Subject: Re: staging: ks7010: Replace three printk() calls by pr_err()
Message-Id: <68dcf04d-ade3-b67a-144d-33bd5ebd0049@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <7fcc8cb1-012a-a66e-6563-6867862f3229@users.sourceforge.net>
 <1471e8af-129d-8a7a-c7d9-1e1fbe0237ec@users.sourceforge.net>
 <1471031030.18251.18.camel@perches.com>
 <a6b96b51-a602-f22d-b853-0ee2f142fb67@users.sourceforge.net>
 <1471109478.3467.33.camel@perches.com>
 <3837d167-b920-d36f-3b75-f37d4b92031d@users.sourceforge.net>
 <1471118088.3467.55.camel@perches.com>
In-Reply-To: <1471118088.3467.55.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa@the-dreams.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Jean Delvare <jdelvare@suse.de>

> You might have noticed I also wrote in the same reply:
> 
> "All of these pr_fmt uses are redundant as pr_err already does pr_fmt"

I admit that I made another software development mistake there. - It might not matter much
when a final fix could be to get rid of the three affected logging calls for example.


> It is not just principle.
> It is a fundamental for kernel patch submission.

I hope that this view supports still the reordering for update steps after some discussion.


> I am not an upstream path.
> Greg KH generally serves that function here.
> My suggestion would be to resend the entire patchset as V(n+1).

I am curious if it would make sense to reduce the mail traffic a bit by finding out
which software changes can be accepted already.

Regards,
Markus
