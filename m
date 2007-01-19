From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 19 Jan 2007 08:09:07 +0000
Subject: [KJ] value of "__attribute__((no_instrument_function))"??
Message-Id: <Pine.LNX.4.64.0701190258510.20218@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i just noticed that there are a *very* small number of routines in
the source tree tagged with the attribute of "no_instrument_function".

$ grep -rw no_instrument_function .
./net/rxrpc/main.c:__attribute__((no_instrument_function));
./net/rxrpc/main.c:__attribute__((no_instrument_function));
./fs/afs/main.c:__attribute__((no_instrument_function));
./fs/afs/main.c:__attribute__((no_instrument_function));

  from the gcc manual:

"If -finstrument-functions is given, profiling function calls will be
generated at entry and exit of most user-compiled functions. Functions
with this attribute will not be so instrumented."

  that *seems* like a useful attribute so the obvious question is --
why is it not used more widely?  that seems kind of odd.  (in fact,
the functions with these attributes are all commented out within an
"#if 0" so they make no difference, anyway.)

  so ... is there any application to that attribute *at all* within
the kernel?  thanks.

rday

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
