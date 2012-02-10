From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 10 Feb 2012 21:05:36 +0000
Subject: Re: [PATCH v2] scripts/coccinelle/misc/boolinit.cocci: semantic patch for bool issues
Message-Id: <alpine.DEB.2.02.1202102205240.1967@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1328905355-30874-1-git-send-email-Julia.Lawall@lip6.fr> <874nuye7aa.fsf@rustcorp.com.au>
In-Reply-To: <874nuye7aa.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Julia Lawall <julia@diku.dk>, kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix.work@gmail.com>, cocci@diku.dk, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, bruce.w.allan@intel.com, joe@perches.com



On Sat, 11 Feb 2012, Rusty Russell wrote:

> On Fri, 10 Feb 2012 21:22:35 +0100, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
>> From: Julia Lawall <Julia.Lawall@lip6.fr>
>>
>> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> FWIW:
> Reviewed-by: Rusty Russell <rusty@rustcorp.com.au>
>
>> +coccilib.report.print_report(p2[0],"WARNING: Assignment of bool to non-0/1 constant")
>
> IMHO, this one should be an error!

OK, I've changed that one.

julia
