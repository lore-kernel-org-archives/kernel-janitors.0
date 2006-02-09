From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Thu, 09 Feb 2006 22:16:36 +0000
Subject: Re: [KJ] Correct imprecise >= comparisons
Message-Id: <82faac5b0602091416p1cb2da66s45f0bb6ccf3207fe@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060208185312.GA26914@rhlx01.fht-esslingen.de>
In-Reply-To: <20060208185312.GA26914@rhlx01.fht-esslingen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/9/06, Eric Sesterhenn <snakebyte@gmx.de> wrote:

> snakebyte@alice:~$ gcc test.c
> snakebyte@alice:~$ ./a.out
> i>=3 : 11
> i>3 : 28
>
> seems the >= actually performs faster on my athlon xp...
>
> on a non xp athlon i get this:
> i>=3 : 11
> i>3 : 31
>
> good i also checked an intel box :) my centrino gives the following:
>
> i>=3 : 66
> i>3 : 47
>
> and a friends amd64
>
> i >= 3 : 8
> i>3 : 22
>
> here the i>3 is faster... seems we need a macro for this stuff, which we
> can change for each processor type ;-)
>
> Greetings, Eric

Interesting
I guess on alot of arch's doing

if (value >= max+1)
        value = max;

might be the more efficient.

hmm will have to investigate further.

Darren J.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
