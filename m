From: Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 21 Oct 2015 11:41:43 +0000
Subject: Re: [v2] powerpc/prom: Avoid reference to potentially freed memory
Message-Id: <20151021114143.EE9111409F8@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1445031525-20086-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, benh@kernel.crashing.org, paulus@samba.org
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Fri, 2015-16-10 at 21:38:45 UTC, Christophe Jaillet wrote:
> of_get_property() is used inside the loop, but then the reference to the
> node is dropped before dereferencing the prop pointer, which could by then
> point to junk if the node has been freed.
> 
> Instead use of_property_read_u32() to actually read the property
> value before dropping the reference.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/1856f50c66dff0afb4a6a3e2

cheers
