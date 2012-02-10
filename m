From: Rusty Russell <rusty@rustcorp.com.au>
Date: Fri, 10 Feb 2012 20:58:16 +0000
Subject: Re: [PATCH v2] scripts/coccinelle/misc/boolinit.cocci: semantic patch for bool issues
Message-Id: <874nuye7aa.fsf@rustcorp.com.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1328905355-30874-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1328905355-30874-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix.work@gmail.com>, cocci@diku.dk, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, bruce.w.allan@intel.com, joe@perches.com

On Fri, 10 Feb 2012 21:22:35 +0100, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

FWIW: 
Reviewed-by: Rusty Russell <rusty@rustcorp.com.au>

> +coccilib.report.print_report(p2[0],"WARNING: Assignment of bool to non-0/1 constant")

IMHO, this one should be an error!

Thanks,
Rusty.
