From: Adrian Bunk <bunk@kernel.org>
Date: Sat, 26 Apr 2008 16:38:08 +0000
Subject: Re: [PATCH] headerdep: a tool for detecting inclusion cycles in
Message-Id: <20080426163808.GJ2252@cs181133002.pp.htv.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080426134554.GA20727@damson.getinternet.no> <20080426161714.GR14990@parisc-linux.org>
In-Reply-To: <20080426161714.GR14990@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: Vegard Nossum <vegard.nossum@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Apr 26, 2008 at 10:17:14AM -0600, Matthew Wilcox wrote:
> On Sat, Apr 26, 2008 at 03:45:54PM +0200, Vegard Nossum wrote:
> > Maybe something like this could be useful for cleaning up headers (and
> > maintaining that cleanliness once it has been achieved). What do you think?
> > 
> > Subject: [PATCH] headerdep: a tool for detecting inclusion cycles in header files
> 
> Do we actually have inclusion cycles in header files?
>...

Yes, e.g. between include/linux/vmstat.h and include/linux/mm.h that 
directly #include each other.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

