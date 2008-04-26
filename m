From: Adrian Bunk <bunk@kernel.org>
Date: Sat, 26 Apr 2008 16:44:50 +0000
Subject: Re: [PATCH] headerdep: a tool for detecting inclusion cycles in
Message-Id: <20080426164450.GK2252@cs181133002.pp.htv.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080426134554.GA20727@damson.getinternet.no>
In-Reply-To: <20080426134554.GA20727@damson.getinternet.no>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Apr 26, 2008 at 03:45:54PM +0200, Vegard Nossum wrote:
> Hi Sam,
> 
> Maybe something like this could be useful for cleaning up headers (and
> maintaining that cleanliness once it has been achieved). What do you think?
>...

And another note (after looking at the Cc list):

Header cleanup is *not* something suitable as a first task for a janitor.

The interesting cases are non-trivial.

And you need cross compilers for all architectures since fiddling with 
#include's under include/ breaks code left and right that only compiled 
due to some implicit #include (and if it still works due to another 
implicit #include on x86 the latter might not be present on all 
architectures).

> Vegard
>...

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

