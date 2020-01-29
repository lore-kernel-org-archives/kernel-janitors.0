From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Wed, 29 Jan 2020 05:17:30 +0000
Subject: Re: [PATCH 10/10] powerpc/powernv: use resource_size
Message-Id: <486sDq0d8Qz9sS3@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1577900990-8588-11-git-send-email-Julia.Lawall@inria.fr>
References: <1577900990-8588-11-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577900990-8588-11-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Wed, 2020-01-01 at 17:49:50 UTC, Julia Lawall wrote:
> Use resource_size rather than a verbose computation on
> the end and start fields.
> 
> The semantic patch that makes these changes is as follows:
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

https://git.kernel.org/powerpc/c/552aa086944a9aeabd599892007c2c7faedb894e

cheers
