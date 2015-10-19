From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 19 Oct 2015 09:27:57 +0000
Subject: Re: [PATCH v2] powerpc/prom: Avoid reference to potentially freed memory
Message-Id: <1445246877.30407.1.camel@ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1444976055-19148-1-git-send-email-christophe.jaillet@wanadoo.fr>
 <1445031525-20086-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1445031525-20086-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, benh@kernel.crashing.org, paulus@samba.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 2015-10-16 at 23:38 +0200, Christophe JAILLET wrote:

> of_get_property() is used inside the loop, but then the reference to the
> node is dropped before dereferencing the prop pointer, which could by then
> point to junk if the node has been freed.
> 
> Instead use of_property_read_u32() to actually read the property
> value before dropping the reference.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> v2: Fix missing '{'
> *** COMPILE-TESTED ONLY ***

Thanks, this looks good. I'll test it on real hardware.

Can you send me a follow up which does the of_get_next_parent() conversion?

cheers

