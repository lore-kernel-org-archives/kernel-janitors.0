From: Joe Perches <joe@perches.com>
Date: Fri, 10 Feb 2012 17:45:43 +0000
Subject: Re: [PATCH] scripts/coccinelle/misc/boolinit.cocci: semantic patch for bool issues
Message-Id: <1328895943.14197.1.camel@joe2Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1328893887-28932-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1328893887-28932-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Julia Lawall <julia@diku.dk>, kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix.work@gmail.com>, cocci@diku.dk, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, bruce.w.allan@intel.com, rusty@rustcorp.com.au

On Fri, 2012-02-10 at 18:11 +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>

Thanks Julia.  It seems to work well.

Someone could run this with:

$ make coccicheck COCCI=scripts/coccinelle/misc/boolinit.cocci

