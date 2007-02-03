From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 03 Feb 2007 07:42:09 +0000
Subject: Re: [KJ] [RFC] Regarding min/max
Message-Id: <Pine.LNX.4.64.0702030240180.22743@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45C3E402.3000307@student.ltu.se>
In-Reply-To: <45C3E402.3000307@student.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 3 Feb 2007, Richard Knutsson wrote:

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
> What about variables in structs? It seem to not like the multiple
> lines in min()/max(), so why not introduce something like: #define
> __min(x,y) ((x) < (y) ? (x) : (y)) (and use __min() in min() also)?
> Then there would be no problem to clean up in the structs + the
> underscores should make people aware it does not type-check.
>
> Just a thought
> /Richard Knutsson

as hard as it may be to believe, i'm going to sit this one out.  :-)
i don't really have any strong opinions on how to implement min/max
routines, but it *is* obvious that there's a lot of that kind of
cleanup that could be done.

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://www.fsdev.dreamhosters.com/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
