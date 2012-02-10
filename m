From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 10 Feb 2012 20:19:53 +0000
Subject: Re: [Cocci] [PATCH] scripts/coccinelle/misc/boolinit.cocci: semantic patch for bool issues
Message-Id: <alpine.DEB.2.02.1202102119400.1967@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1328893887-28932-1-git-send-email-Julia.Lawall@lip6.fr> <1328900668.22240.100.camel@sauron.fi.intel.com>
In-Reply-To: <1328900668.22240.100.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Julia Lawall <julia@diku.dk>, Michal Marek <mmarek@suse.cz>, Gilles Muller <Gilles.Muller@lip6.fr>, bruce.w.allan@intel.com, rusty@rustcorp.com.au, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@diku.dk, joe@perches.com



On Fri, 10 Feb 2012, Artem Bityutskiy wrote:

> On Fri, 2012-02-10 at 18:11 +0100, Julia Lawall wrote:
>> +coccilib.report.print_report(p[0],"ERROR: Comparison of bool to 0/1")
>
> All of these look more like style/taste/hygiene suggestions, and I think
> they should be tagged as "WARNING", not "ERROR".

OK, I'll fix that.

julia
