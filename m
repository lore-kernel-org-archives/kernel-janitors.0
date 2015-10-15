From: Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 15 Oct 2015 11:11:00 +0000
Subject: Re: powerpc/mpc5xxx: Use of_get_next_parent to simplify code
Message-Id: <20151015111100.87B391402BF@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1444595260-3332-1-git-send-email-christophe.jaillet@wanadoo.fr>
References: <20151014040011.8AB1514110A@ozlabs.org>
In-Reply-To: <20151014040011.8AB1514110A@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, benh@kernel.crashing.org, paulus@samba.org
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Sun, 2015-11-10 at 20:27:40 UTC, Christophe Jaillet wrote:
> of_get_next_parent can be used to simplify the while() loop and
> avoid the need of a temp variable.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/b340587e68b479e52039f800

cheers
