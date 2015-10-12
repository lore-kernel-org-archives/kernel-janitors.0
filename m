From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 12 Oct 2015 11:17:18 +0000
Subject: Re: [1/2] powerpc/nvram: Add missing kfree in error path
Message-Id: <20151012111719.07ACD14029E@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <4fd8daff1bb5daad99d909aa75ff5c2702c4c490.1437117145.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, benh@kernel.crashing.org, paulus@samba.org
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Fri, 2015-17-07 at 07:19:59 UTC, Christophe Jaillet wrote:
> If 'nvram_write_header' fails, then 'new_part' should be freed, otherwise,
> there is a memory leak.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/7d523187173294f6ae3b86a4

cheers
