From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 22 May 2007 12:54:08 +0000
Subject: Re: [KJ] question on double cast
Message-Id: <20070522125408.GE18519@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87y7jh4669.fsf@wanadoo.fr>
In-Reply-To: <87y7jh4669.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, May 22, 2007 at 02:15:13PM +0200, Yoann Padioleau wrote:
> But isn't it equivalent to directly do 
> 
>   wr->ep_handle = (u32) cm_id->provider_data;

Try it on a 64-bit platform -- you get a warning about cast from pointer
to an integer of a different size.  The double-cast idiom tells the
compiler you really do know what you're doing here.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
