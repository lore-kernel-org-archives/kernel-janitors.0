From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 13 Apr 2020 12:00:39 +0000
Subject: Re: [PATCH RESEND] MAINTAINERS: rectify EDAC-SIFIVE entry
Message-Id: <alpine.DEB.2.21.2004131358020.7282@felia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200413073447.9284-1-lukas.bulwahn@gmail.com> <20200413081556.GB3772@zn.tnic>
In-Reply-To: <20200413081556.GB3772@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Christoph Hellwig <hch@lst.de>, Yash Shah <yash.shah@sifive.com>, linux-edac@vger.kernel.org, Sebastian Duda <sebastian.duda@fau.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Mon, 13 Apr 2020, Borislav Petkov wrote:
> 
> Looking at that a bit - I think the right thing to do is to remove that
> sifive_l2_cache.c file from the EDAC-SIFIVE file pattern because the
> edac driver is simply using the L2 thing to register on its notifier
> chain, i.e., using an external facility, like all the drivers do. And the
> l2_cache thing is not part of the edac driver.
> 

Thanks for the pointer.

I adjusted the patch, first accidently sent a broken PATCH v2 (which 
shall be ignored), but this PATCH v3 shall be picked:

https://lore.kernel.org/lkml/20200413115255.7100-1-lukas.bulwahn@gmail.com/


Lukas
