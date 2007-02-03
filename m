From: Randy Dunlap <rdunlap@xenotime.net>
Date: Sat, 03 Feb 2007 01:45:55 +0000
Subject: Re: [KJ] [RFC] Regarding min/max
Message-Id: <20070202174555.d94e5d5c.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45C3E402.3000307@student.ltu.se>
In-Reply-To: <45C3E402.3000307@student.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 03 Feb 2007 02:23:14 +0100 Richard Knutsson wrote:

> Hi
> 
> Regarding converting:
> 
> 	a = x < y ? x : y;
> 
> with
> 	a = min(x, y);
> and etc.
> 
> What about variables in structs? It seem to not like the multiple lines in min()/max(),

Can you give an example of this "not like"?
Thanks.

> so why not introduce something like:
> #define __min(x,y)	((x) < (y) ? (x) : (y))
> (and use __min() in min() also)? Then there would be no problem to clean up in the structs
> + the underscores should make people aware it does not type-check.



---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
