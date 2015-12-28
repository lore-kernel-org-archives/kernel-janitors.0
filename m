From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 28 Dec 2015 15:12:26 +0000
Subject: Re: [media] m88rs6000t: Better exception handling in five functions
Message-Id: <alpine.DEB.2.10.1512281610390.2702@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net> <5680FDB3.7060305@users.sourceforge.net> <alpine.DEB.2.10.1512281019050.2702@hadrien> <56810F56.4080306@users.sourceforge.net> <alpine.DEB.2.10.1512281134590.2702@hadrien> <568148FD.7080209@users.sourceforge.net>
 <5681497E.7030702@users.sourceforge.net> <alpine.DEB.2.10.1512281541330.2702@hadrien> <56814F35.5030103@users.sourceforge.net>
In-Reply-To: <56814F35.5030103@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, 28 Dec 2015, SF Markus Elfring wrote:

> >> Move the jump label directly before the desired log statement
> >> so that the variable "ret" will not be checked once more
> >> after a function call.
> >
> > This commit message fits with the previous change.
>
> Do you prefer an other wording?

Something like "Split the return into success and error cases, to avoid
the need for testing before logging."

The concept of the return being duplicated didn't come across in your
message.

> > It could be nice to put a blank line before the error handling code.
>
> Is it really a coding style requirement to insert another blank line between
> the suggested placement of the statement "return 0;" and the jump label?

I don't think it is a requirement.  But some files do it, and if other
functions in this file do it, then it would be nice to do the same.

julia
