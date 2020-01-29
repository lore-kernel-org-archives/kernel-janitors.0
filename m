From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Wed, 29 Jan 2020 05:17:29 +0000
Subject: Re: [PATCH 1/4] misc: cxl: use mmgrab
Message-Id: <486sDn1mr8z9sSD@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1577634178-22530-2-git-send-email-Julia.Lawall@inria.fr>
References: <1577634178-22530-2-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577634178-22530-2-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>, Frederic Barrat <fbarrat@linux.ibm.com>
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

On Sun, 2019-12-29 at 15:42:55 UTC, Julia Lawall wrote:
> Mmgrab was introduced in commit f1f1007644ff ("mm: add new mmgrab()
> helper") and most of the kernel was updated to use it. Update a
> remaining file.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> <smpl>
> @@ expression e; @@
> - atomic_inc(&e->mm_count);
> + mmgrab(e);
> </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/30e813cf46ccaeea6508607632e49b4a1d743d2a

cheers
