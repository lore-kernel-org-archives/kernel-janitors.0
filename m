From: Borislav Petkov <bp@amd64.org>
Date: Wed, 12 Sep 2012 11:00:22 +0000
Subject: Re: [patch] x86, microcode, AMD: use after free in free_cache()
Message-Id: <20120912110022.GA6470@aftab.osrc.amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120905123042.GB6128@elgon.mountain>
In-Reply-To: <20120905123042.GB6128@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 05, 2012 at 03:30:42PM +0300, Dan Carpenter wrote:
> list_for_each_entry_reverse() dereferences the iterator, but we already
> freed it.  I don't see a reason that this has to be done in reverse
> order so I've changed it to use list_for_each_entry_safe().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is only needed on linux-next.  Sorry, it turns out that I don't
> have any AMD systems right now, so I have not tested this.

Ok, just ran it and it looks good.

Acked-by: Borislav Petkov <borislav.petkov@amd.com>

@hpa, this one should go ontop of tip/x86/microcode.

Thanks.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
GM: Alberto Bozzo
Reg: Dornach, Landkreis Muenchen
HRB Nr. 43632 WEEE Registernr: 129 19551
