From: Michal Marek <mmarek@suse.cz>
Date: Fri, 24 Feb 2012 23:11:53 +0000
Subject: Re: [PATCH v3] scripts/coccinelle/misc/boolinit.cocci: semantic patch for bool issues
Message-Id: <20120224231153.GE19992@sepie.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1328907918-31335-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1328907918-31335-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Julia Lawall <julia@diku.dk>, kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix.work@gmail.com>, cocci@diku.dk, linux-kernel@vger.kernel.org, bruce.w.allan@intel.com, joe@perches.com, rusty@rustcorp.com.au

On Fri, Feb 10, 2012 at 10:05:18PM +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> ERROR's changed to WARNING, except in assignment to non-0/1 case.

Applied to kbuild.git#misc.

Michal
