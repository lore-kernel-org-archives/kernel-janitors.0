From: Richard Cochran <richardcochran@gmail.com>
Date: Mon, 21 Dec 2015 10:12:36 +0000
Subject: Re: posix-clock: Use an unsigned data type for a variable
Message-Id: <20151221101236.GA4285@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <56766488.9050402@users.sourceforge.net>
 <20151220200934.GB2027@netboy>
 <5677C6B3.8060007@users.sourceforge.net>
In-Reply-To: <5677C6B3.8060007@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Mon, Dec 21, 2015 at 10:30:27AM +0100, SF Markus Elfring wrote:
> > In this case, there is indeed a problem.  However, just changing the
> > type won't fix it.
> 
> Would you like to explain your view on the handling of potential
> data type mismatches a bit more?

Yes, I will explain in the patch that follows.

Thanks,
Richard
