From: Borislav Petkov <bp@alien8.de>
Date: Fri, 18 Aug 2017 17:14:34 +0000
Subject: Re: [PATCH] EDAC, thunderx: Fix an error handling path in 'thunderx_lmc_probe()'
Message-Id: <20170818171434.qlxnimpnuvrhipa7@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170816045821.14165-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170816045821.14165-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: ralf@linux-mips.org, david.daney@cavium.com, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Aug 16, 2017 at 06:58:21AM +0200, Christophe JAILLET wrote:
> 'ret' is known to be 0 at this point.
> If 'ioremap()' fails, returns -ENOMEM instead of 0 which means success.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/edac/thunderx_edac.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
