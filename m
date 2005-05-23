From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 23 May 2005 01:05:26 +0000
Subject: Re: [KJ] [PATCH] Fix gcc4 warning,
Message-Id: <200505230305.27341.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <428E3224.8030307@cs.pdx.edu>
In-Reply-To: <428E3224.8030307@cs.pdx.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On S=FCnndag 22 Mai 2005 20:33, Jesse Millan wrote:
> Its not easy to reproduce this warning in a simple program. And, I am
> not sure that it is a bug on gcc4's part. It looks like gcc4 emits the
> warning when it cannot prove beyond a shadow of doubt that the variable
> is initialized before use.

Right. The behavior of gcc4 makes perfect sense, I would not call it a
bug at all, even though it could still become smarter.
=20
> In an effort to cut down on warnings, should these be fixed? It can go
> either way, the compiler should be smart enough and maybe it will be
> someday, or, do the initialization to get rid of a bunch of warnings.

As I said, they should be fixed in the kernel, the released compiler
won't go away any more so it doesn't matter if future compilers are
smarter than the current one.

	Arnd <><

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
