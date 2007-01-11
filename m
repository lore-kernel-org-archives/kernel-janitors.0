From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 11 Jan 2007 04:33:08 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <Pine.LNX.4.64.0701102332320.11890@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 11 Jan 2007, Darren Jenkins wrote:

> also was thinking we should add
>
> static inline unsigned long round_down_to_power_of_2(unsigned long i)
> {
>
> +     i &= ~(i>>1);    ????
>    while (i & (i - 1))
>        i &= (i - 1);
>
>    return i;
> }
>
> which follows from my eirlier idea.

sorry, what was the rationale for that extra line up there?

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
