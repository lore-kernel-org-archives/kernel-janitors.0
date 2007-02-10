From: Bernd Petrovitsch <bernd@firmix.at>
Date: Sat, 10 Feb 2007 17:01:42 +0000
Subject: Re: [KJ] is there a short form for "memset(blah, 0, len)"?
Message-Id: <1171126902.10714.12.camel@gimli.at.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702101112510.4576@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702101112510.4576@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 2007-02-10 at 11:14 -0500, Robert P. J. Day wrote:
>   i doubt anything will ever come of this but, given the number of
> calls to "memset(addr, 0, len)", did anyone ever consider defining a
> macro short form, say:
> 
>   clearmem(addr, len)
>   zeromem(addr, len)

*BSD had "bzero()".

> or something like that?  just curious.

Did you ever read the man page of "bzero()"?

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
