From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Wed, 29 Jan 2020 05:17:30 +0000
Subject: Re: [PATCH 05/10] powerpc/83xx: use resource_size
Message-Id: <486sDp3hCcz9sSG@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1577900990-8588-6-git-send-email-Julia.Lawall@inria.fr>
References: <1577900990-8588-6-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577900990-8588-6-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>, Scott Wood <oss@buserror.net>
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2020-01-01 at 17:49:45 UTC, Julia Lawall wrote:
> Use resource_size rather than a verbose computation on
> the end and start fields.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> <smpl>
> @@ struct resource ptr; @@
> - (ptr.end - ptr.start + 1)
> + resource_size(&ptr)
> </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/bfbe37f0ce994e7a9945653d7624fadc5c500a9f

cheers
