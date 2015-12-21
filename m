From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Dec 2015 09:30:27 +0000
Subject: Re: posix-clock: Use an unsigned data type for a variable
Message-Id: <5677C6B3.8060007@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <56766488.9050402@users.sourceforge.net>
 <20151220200934.GB2027@netboy>
In-Reply-To: <20151220200934.GB2027@netboy>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Cochran <richardcochran@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> In this case, there is indeed a problem.  However, just changing the
> type won't fix it.

Would you like to explain your view on the handling of potential
data type mismatches a bit more?

Regards,
Markus
