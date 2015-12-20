From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 20 Dec 2015 12:51:11 +0000
Subject: Re: [PATCH] posix-clock: Use an unsigned data type for a variable
Message-Id: <alpine.DEB.2.02.1512201350100.2067@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <56766488.9050402@users.sourceforge.net> <alpine.DEB.2.02.1512201208250.2067@localhost6.localdomain6> <5676A399.4080007@users.sourceforge.net>
In-Reply-To: <5676A399.4080007@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>



On Sun, 20 Dec 2015, SF Markus Elfring wrote:

> >> Reuse the type from this poll call instead.
> > 
> > Why use uint when the function return type it unsigned int?
> 
> Do you prefer to express the type modifier once more there?

I don't know what the sentence means, but I think that the type should be 
referenced in a consistent manner.

> > On the other hand, why is the function return type unsigned int
> > when there is a return of a negative constant?
> 
> This implementation detail can trigger further software development
> considerations, can't it?

It would seem reasonable to address all of the signed/unsigned issues 
related to the function return value at once.

julia

> This is a general issue for the exception handling in several functions.
> Would you like to improve any more source code around it?
> 
> Regards,
> Markus
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
