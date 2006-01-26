From: Adrian Bunk <bunk@stusta.de>
Date: Thu, 26 Jan 2006 08:11:45 +0000
Subject: Re: [KJ] [Patch 8/9] BUG_ON() Conversion in md/raid6main.c
Message-Id: <20060126081145.GV3590@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76334056768337355=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138233643.7232.45.camel@alice>
In-Reply-To: <1138233643.7232.45.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============76334056768337355==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 25, 2006 at 04:34:45PM -0800, Greg KH wrote:
> On Thu, Jan 26, 2006 at 01:00:43AM +0100, Eric Sesterhenn / snakebyte wrote:
> > hi,
> > 
> > this changes if() BUG(); constructs to BUG_ON() which is
> > cleaner and can better optimized away
> 
> gcc optimizes them away if BUG() is not defined, so this is not a true
> statement.

This is true due to the unlikely() in the BUG_ON() definition.

I don't know whether this makes a measurable difference, but besides 
this I consider it a coding style issue since

  BUG_ON(foo);

is IMHO better readable than

  if (foo)
     BUG();


> thanks,
> 
> greg k-h

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============76334056768337355==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76334056768337355==--
