From: "Howell, David P" <david.p.howell@intel.com>
Date: Sat, 27 Jan 2007 23:47:37 +0000
Subject: Re: [KJ] replacing "__FUNCTION__" with "__func__"?
Message-Id: <3B06E32CF3FCA74A8F072DE335057C89015A0003@fmsmsx413.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701271038360.9089@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701271038360.9089@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If it's only a shorter version for __FuNCTION__, is this eally worth 
the trouble? With no other benefits I'd forget it.

-----Original Message-----
From: kernel-janitors-bounces@lists.osdl.org
[mailto:kernel-janitors-bounces@lists.osdl.org] On Behalf Of Arnaldo
Carvalho de Melo
Sent: Saturday, January 27, 2007 2:34 PM
To: Robert P. J. Day
Cc: Kernel Janitors List
Subject: Re: [KJ] replacing "__FUNCTION__" with "__func__"?

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

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
