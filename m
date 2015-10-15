From: Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 15 Oct 2015 11:10:59 +0000
Subject: Re: powerpc/numa: Use of_get_next_parent to simplify code
Message-Id: <20151015111059.D8BC91402DD@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1444595007-3029-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, benh@kernel.crashing.org, paulus@samba.org
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Sun, 2015-11-10 at 20:23:27 UTC, Christophe Jaillet wrote:
> of_get_next_parent can be used to simplify the while() loop and
> avoid the need of a temp variable.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/1def37586fb1f3bbbedeaa64

cheers
