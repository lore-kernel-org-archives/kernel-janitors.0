From: David Sterba <dsterba@suse.cz>
Date: Mon, 01 Dec 2014 15:20:48 +0000
Subject: Re: [PATCH 1/8] purgatory/sha256: replace memset by memzero_explicit
Message-Id: <20141201152047.GG12140@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417366774-32412-1-git-send-email-Julia.Lawall@lip6.fr>
 <1417366774-32412-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417366774-32412-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Thomas Gleixner <tglx@linutronix.de>, dborkman@redhat.com, herbert@gondor.apana.org.au, kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>

On Sun, Nov 30, 2014 at 05:59:27PM +0100, Julia Lawall wrote:
> @@ -205,7 +205,7 @@ static void sha256_transform(u32 *state, const u8 *input)
>  
>  	/* clear any sensitive info... */
>  	a = b = c = d = e = f = g = h = t1 = t2 = 0;

All of these get optimized away.

How to clear them effectively is another question.  Setting them one by
one casting to volatile would generate 10 instructions. Although this
might be quick as there are no dependencies, the function
sha256_transform is called repeatedly and the small overhead may add up.

Other attempts to fix it require restructuring the code so all the
variables are eg. stored in an array that gets cleared in one go. Here
the indirect access could be hidden into the macros (e0, e1, s0, s1).

> -	memset(W, 0, 64 * sizeof(u32));
> +	memzero_explicit(W, 64 * sizeof(u32));
