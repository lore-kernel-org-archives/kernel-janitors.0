From: "Vegard Nossum" <vegard.nossum@gmail.com>
Date: Sat, 26 Apr 2008 16:57:09 +0000
Subject: Re: [PATCH] headerdep: a tool for detecting inclusion cycles in header file
Message-Id: <19f34abd0804260957i62db6929s2a4227a517f3c9a1@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080426134554.GA20727@damson.getinternet.no>
	 <20080426164450.GK2252@cs181133002.pp.htv.fi>
In-Reply-To: <20080426164450.GK2252@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 4/26/08, Adrian Bunk <bunk@kernel.org> wrote:
> On Sat, Apr 26, 2008 at 03:45:54PM +0200, Vegard Nossum wrote:
>
> > Hi Sam,
>  >
>  > Maybe something like this could be useful for cleaning up headers (and
>  > maintaining that cleanliness once it has been achieved). What do you think?
>
> >...
>
>  And another note (after looking at the Cc list):
>
>  Header cleanup is *not* something suitable as a first task for a janitor.

Hehe, yes, I could not agree more!

I have been trying to resolve some of these errors myself, but it's
incredibly hard to get right.

The reason I CCed kernel-janitors is that this IS a janitorial
project. But I am not implying that janitor means "newbie" or trivial.
At least the way I see it, janitor work is cleaning up, but not
necessarily easy work. But I agree, definitely not a first task job.

>  The interesting cases are non-trivial.
>
>  And you need cross compilers for all architectures since fiddling with
>  #include's under include/ breaks code left and right that only compiled
>  due to some implicit #include (and if it still works due to another
>  implicit #include on x86 the latter might not be present on all
>  architectures).

Yep. I have been compiling cross-compilers myself. As a btw, I had
already started some project to distribute binary cross-compilers
http://folk.uio.no/vegardno/crosstool/ for the purpose of making
cross-compiling easier to get started with. (It would be cool to have
a complete suite of working cross-compilers in a single download.)

Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
