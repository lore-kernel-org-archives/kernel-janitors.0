From: Domen Puncer <domen@coderock.org>
Date: Mon, 20 Dec 2004 13:02:38 +0000
Subject: [KJ] Re: janitor project: fix gcc 4 warnings
Message-Id: <20041220130238.GB29520@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78806278742135705=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78806278742135705==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 19/12/04 22:00 +0100, Tobias Klauser wrote:
> Hi
> 
> On Sunday 19 December 2004 20:09, Andi Kleen wrote:
> > Short howto:
> >
> > Get
> > ftp://gcc.gnu.org/pub/gcc/snapshots/4.0-20041219/gcc-core-4.0-20041219.tar.
> >bz2
> >
> > Untar it and compile with
> >
> > mkdir obj
> > ../gcc-*/configure --disable-checking --enable-languages=c
> > --prefix=/usr/local/gcc4 make bootstrap
> > <as root>
> > make install
> >
> >
> > Then compile an uptodate 2.6 kernel with:
> >
> > make allmodconfig
> > make CC=/usr/local/gcc4/bin/gcc 2>&1 | tee LOG
> > grep warning LOG
> Cool howto, thanks. Maybe that should go onto the TODO list over at 
> kerneljanitors.org?

Added.

> 
> >
> > You'll see lots of warnings in LOG. Fix them all and submit patches
> > through the usual janitor channels.
> 
> I already compiled GCC4 and it took about 15 minutes on an Athlon Tbird 1.4 
> GHz to finish. When compiling Linux 2.6.10-rc3 with GCC4 there are lots of 
> warnings (as expected) and even a fatal error.
> So I'm trying to fix some of these warnings. They are all over the kernel tree 
> and so I'm curious what would be the best method to split and submit the 
> patches?

Patch per file (and per mail).
For submitting, Andrew's patch-bomb (from patch-scripts) might be useful.


	Domen

--===============78806278742135705==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78806278742135705==--
