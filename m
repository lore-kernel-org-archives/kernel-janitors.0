From: Borislav Petkov <bp@alien8.de>
Date: Wed, 15 Apr 2020 09:34:35 +0000
Subject: Re: [PATCH v3] MAINTAINERS: place sifive_l2_cache.c only in SIFIVE DRIVERS
Message-Id: <20200415093435.GC31016@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200413115255.7100-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200413115255.7100-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Christoph Hellwig <hch@lst.de>, Borislav Petkov <bp@suse.de>, Yash Shah <yash.shah@sifive.com>, linux-edac@vger.kernel.org, Sebastian Duda <sebastian.duda@fau.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 13, 2020 at 01:52:55PM +0200, Lukas Bulwahn wrote:
> Commit 9209fb51896f ("riscv: move sifive_l2_cache.c to drivers/soc") moved
> arch/riscv/mm/sifive_l2_cache.c to drivers/soc/sifive/sifive_l2_cache.c
> and adjusted the MAINTAINERS EDAC-SIFIVE entry but slipped in a mistake.
> 
> Since then, ./scripts/get_maintainer.pl --self-test complains:
> 
>   warning: no file matches F: drivers/soc/sifive_l2_cache.c
> 
> Boris suggested that sifive_l2_cache.c is considered part of the SIFIVE
> DRIVERS, not part of EDAC-SIFIVE. So, we can simply drop this entry, and
> by the sifive keyword pattern in SIFIVE PATTERNS, it is automatically part
> of the SIFIVE DRIVERS.
> 
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
