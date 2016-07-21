From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 21 Jul 2016 12:54:26 +0000
Subject: Re: staging: ks7010: Delete unnecessary uses of the variable "retval"
Message-Id: <alpine.DEB.2.10.1607211451350.2927@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net> <6a8f4258-188e-36f6-28fa-1626c29cf361@users.sourceforge.net> <alpine.DEB.2.10.1607172056220.3177@hadrien> <20160720155333.GE1688@katana> <b249584b-47b8-ffd9-432e-986d69260ff1@users.sourceforge.net>
 <20160721062726.GC1664@katana> <alpine.DEB.2.10.1607210925200.2927@hadrien> <c3f1fe70-1270-602c-08ba-b8ba5acbe224@users.sourceforge.net>
In-Reply-To: <c3f1fe70-1270-602c-08ba-b8ba5acbe224@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Wolfram Sang <wsa@the-dreams.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



On Thu, 21 Jul 2016, SF Markus Elfring wrote:

> > I think the original code was fine.
>
> I suggest to reconsider involved implementation details once more.
>
>
> > x = blah(); if (x) ... is a perfectly familiar kernel coding pattern.
>
> I can agree to such a general information.
>
>
> > There is no benefit in terms of performance
>
> It might be possible that a good compiler can also optimise
> some unnecessary variable accesses away.

A compiler written by an undergrad can optimize the variable away in this
case.  That's what compilers do.

> Examples for further background information:
> * "Minimize local variables"
>    https://eventhelix.com/realtimemantra/basics/optimizingcandcppcode.htm#Minimize%20Local%20Variables
>
> * "Temporary Objects" by Danny Kalev
>    http://www.informit.com/guides/content.aspx?g=cplusplus&seqNum8
>
>
> > or understandability in dropping the variable.
>
> I guess that we have got different opinions on such an aspect.
>
> * Do you really want to assign every return value from a function call
>   to an extra variable before it is used again?

If it's a choice between 1) function call on many lines, 2) function call
over 80 characters, and 3) extra variable, I definitely prefer the extra
variable.

julia

>
> * How many reading and understanding capacity do you need for each
>   extra variable?
>
> Regards,
> Markus
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
