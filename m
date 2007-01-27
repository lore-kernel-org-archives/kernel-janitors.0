From: "Arnaldo Carvalho de Melo" <arnaldo.melo@gmail.com>
Date: Sat, 27 Jan 2007 19:33:53 +0000
Subject: Re: [KJ] replacing "__FUNCTION__" with "__func__"?
Message-Id: <39e6f6c70701271133r5503178ep86ba21c40244c459@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701271038360.9089@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701271038360.9089@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 1/27/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
>
>   given what you read here:
>
> http://gcc.gnu.org/onlinedocs/gcc-4.1.1/gcc/Function-Names.html
>
>   i briefly imagined replacing occurrences of "__FUNCTION__" with
> "__func__" until i counted the number of times the former occurs in
> the source tree:  7903.
>
> ouch.

Oh s*it, thans for the reminder, my fingers still goes in automatic
mode adding __FUNCTION__, will try the shorter, lowercase version as a
typing speed booster 8)

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
