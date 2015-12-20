From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 20 Dec 2015 12:48:25 +0000
Subject: Re: [PATCH] posix-clock: Use an unsigned data type for a variable
Message-Id: <5676A399.4080007@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <56766488.9050402@users.sourceforge.net>
 <alpine.DEB.2.02.1512201208250.2067@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1512201208250.2067@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>

>> Reuse the type from this poll call instead.
> 
> Why use uint when the function return type it unsigned int?

Do you prefer to express the type modifier once more there?


> On the other hand, why is the function return type unsigned int
> when there is a return of a negative constant?

This implementation detail can trigger further software development
considerations, can't it?

This is a general issue for the exception handling in several functions.
Would you like to improve any more source code around it?

Regards,
Markus
