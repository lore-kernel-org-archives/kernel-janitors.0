From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 18 Feb 2007 12:43:16 +0000
Subject: Re: [KJ] discouraging the introduction of unnecessary typedefs
Message-Id: <45D849E4.9000506@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702180700400.4148@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702180700400.4148@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Robert P. J. Day wrote:
>   Chapter 5 of the CodingStyle doc is fairly unambiguous in
> recommending against introducing new typedefs, but it appears some
> people can't help themselves:
>   
[snip]
>   not a big deal, of course, but if the recommended coding style is
> that opposed to adding typedefs, perhaps this sort of thing should be
> nipped in the bud before it gets any more widespread.
>   
Just for the fun of it, I checked the diff from 2.6.19 and 2.6.20 
against current and what happened with typedef's:

2.6.20 - current
48 added
244 deleted

2.6.19 - current
187 added
416 deleted

So it seems to go in the right direction :)
It seems it often gets in by new files...

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
