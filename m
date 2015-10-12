From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 12 Oct 2015 11:17:20 +0000
Subject: Re: [2/2] powerpc/nvram: Fix function name in some errors messages.
Message-Id: <20151012111720.4EFEE1402B9@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1571506ab2693a3128625c94f4f89dd802bb6dd2.1437117145.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, benh@kernel.crashing.org, paulus@samba.org
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Fri, 2015-17-07 at 07:20:00 UTC, Christophe Jaillet wrote:
> 'nvram_create_os_partition' should be 'nvram_create_partition'.
> Use __func__ to have it right, as done elsewhere in this file.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/b6080db4f4e8bf28717b8329

cheers
