From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Wed, 29 Jan 2020 05:17:29 +0000
Subject: Re: [PATCH 09/16] powerpc/mpic: constify copied structure
Message-Id: <486sDn3g1Bz9sRp@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1577864614-5543-10-git-send-email-Julia.Lawall@inria.fr>
References: <1577864614-5543-10-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-10-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Wed, 2020-01-01 at 07:43:27 UTC, Julia Lawall wrote:
> The mpic_ipi_chip and mpic_irq_ht_chip structures are only copied
> into other structures, so make them const.
> 
> The opportunity for this change was found using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/5084ff33cac0988c1b979814501dcc2e1ecbf9c0

cheers
