From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 22 May 2007 13:44:37 +0000
Subject: Re: [KJ] question on double cast
Message-Id: <20070522134437.GF18519@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87y7jh4669.fsf@wanadoo.fr>
In-Reply-To: <87y7jh4669.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, May 22, 2007 at 08:52:14AM -0400, John Anthony Kazos Jr. wrote:
> > But isn't it equivalent to directly do 
> > 
> >   wr->ep_handle = (u32) cm_id->provider_data;
> 
> Depends on the endian-ness if you're on a 64-bit architecture. You'll get 
> the high-order 32 or the low-order 32 depending on which are in the first 
> 4 bytes of the 64-bit quantity. The only way that would be safe is if the 
> quantity is never wider than 32 bits.

That would be true if there were a pointer dereference involved, but
it's just a cast.  You'd get the low 32-bits either way, but you get a
warning on 64-bit.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
