From: Borislav Petkov <bp@amd64.org>
Date: Wed, 05 Sep 2012 13:20:57 +0000
Subject: Re: [patch] x86, microcode, AMD: use after free in free_cache()
Message-Id: <20120905132057.GE25264@aftab.osrc.amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120905123042.GB6128@elgon.mountain>
In-Reply-To: <20120905123042.GB6128@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 05, 2012 at 03:30:42PM +0300, Dan Carpenter wrote:
> list_for_each_entry_reverse() dereferences the iterator, but we already
> freed it.

Wait a sec, we assign the iterator in each iteration of the loop, right?

And if so, I don't see a problem: we derefence a new element each time
and *then* free it...

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
GM: Alberto Bozzo
Reg: Dornach, Landkreis Muenchen
HRB Nr. 43632 WEEE Registernr: 129 19551
