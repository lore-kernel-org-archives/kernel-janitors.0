From: Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 15 Oct 2015 06:36:17 +0000
Subject: Re: [PATCH v2] powerpc/mpc5xxx: Avoid dereferencing potentially freed memory
Message-Id: <1444890977.5970.4.camel@ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151014040011.8AB1514110A@ozlabs.org>
 <1444888580-12966-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1444888580-12966-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: benh@kernel.crashing.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2015-10-15 at 07:56 +0200, Christophe JAILLET wrote:
> Use 'of_property_read_u32()' instead of 'of_get_property()'+pointer
> dereference in order to avoid access to potentially freed memory.
> 
> Use 'of_get_next_parent()' to simplify the while() loop and avoid the
> need of a temp variable.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> v2: Use of_property_read_u32 instead of of_get_property+pointer dereference
> *** Untested ***

Thanks.

Can someone with an mpc5xxx test this?

cheers


