From: "Vegard Nossum" <vegard.nossum@gmail.com>
Date: Sat, 26 Apr 2008 15:25:39 +0000
Subject: Re: [PATCH] headerdep: a tool for detecting inclusion cycles in header file
Message-Id: <19f34abd0804260825p4690e4ncdd9a96398f8662d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080426134554.GA20727@damson.getinternet.no>
	 <20080426150030.GH2252@cs181133002.pp.htv.fi>
In-Reply-To: <20080426150030.GH2252@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 4/26/08, Adrian Bunk <bunk@kernel.org> wrote:
> On Sat, Apr 26, 2008 at 03:45:54PM +0200, Vegard Nossum wrote:
>  > Hi Sam,
>  >
>  > Maybe something like this could be useful for cleaning up headers (and
>  > maintaining that cleanliness once it has been achieved). What do you think?
>  >
>  > (One thing which might or might not be good is that 'make headerdep' will
>  >  also compile using CC if they're not already compiled. If this should be
>  >  fixed, I think you'd know how to do it.)
>
>
> This way you only catch problems in the current kernel configuration.
>
>  The only problems are under include/, and you should be able to do this
>  by parsing all headers and without hooking into the build system.

This seems correct. Then a solution similar to 'make headers_check'
should be used.

Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
