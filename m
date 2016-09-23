From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Sep 2016 12:55:25 +0000
Subject: Re: GPU-DRM-TTM: Fine-tuning for several function implementations
Message-Id: <20160923125525.GR13620@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <4d34446f-05ad-c3ce-5d33-8fb4f25af25c@users.sourceforge.net>
 <f079ffc1-042c-0332-98e1-5acc6589e4b6@vodafone.de>
 <05418fb1-ad66-aba3-bd8c-f6b684a83279@users.sourceforge.net>
In-Reply-To: <05418fb1-ad66-aba3-bd8c-f6b684a83279@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Emil Velikov <emil.l.velikov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@lip6.fr>

On Fri, Sep 23, 2016 at 12:20:54PM +0200, SF Markus Elfring wrote:
> > if you call it "restart" or "lock_restart" doesn't make much difference.
> 
> Do other identifiers fit better to a specification from the document "CodingStyle"
> like the following?
> 
> "…
> Choose label names which say what the goto does or why the goto exists.
> …"
>
> 
> Does this wording need any more adjustments?

No.  I wrote that and "restart" seems like a pretty clear name to me.  I
never wrote that you should harrass people with your nonsense patches.
In fact, I have asked you over and over again to stop.

regards,
dan carpenter

