From: Borislav Petkov <bp@amd64.org>
Date: Thu, 06 Sep 2012 16:16:49 +0000
Subject: Re: [patch] x86, microcode, AMD: use after free in free_cache()
Message-Id: <20120906161649.GA2684@aftab.osrc.amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120905123042.GB6128@elgon.mountain>
In-Reply-To: <20120905123042.GB6128@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 06, 2012 at 07:04:01AM -0700, Dan Carpenter wrote:
> You wouldn't see it unless something called kmalloc() on another CPU
> and reused the freed memory. Or if you had CONFIG_DEBUG_SLAB enabled
> then I believe that will poison freed memory immediately.

Oh, I see.

Also, I could probably see it if I do

	p = NULL;

to the iterator AFAICT.

> (Btw, I haven't tested this code either before or after my patch
> because I don't have any AMD systems).

I'll run it when I get back from my vacation next week.

Thanks.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
GM: Alberto Bozzo
Reg: Dornach, Landkreis Muenchen
HRB Nr. 43632 WEEE Registernr: 129 19551
