From: Andi Kleen <ak@muc.de>
Date: Sun, 19 Dec 2004 19:09:03 +0000
Subject: [KJ] janitor project: fix gcc 4 warnings
Message-Id: <20041219190903.GA30192@muc.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============012095844909482345=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============012095844909482345==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Here's a proposed janitor project if anybody is interested:

The current gcc 4.0 snapshots include some more warnings in -Wall
and changed some existing ones which makes a kernel compilation quite noisy. 

The project would be to fix all these warnings.

Short howto: 

Get
ftp://gcc.gnu.org/pub/gcc/snapshots/4.0-20041219/gcc-core-4.0-20041219.tar.bz2

Untar it and compile with 

mkdir obj
../gcc-*/configure --disable-checking --enable-languages=c --prefix=/usr/local/gcc4
make bootstrap
<as root> 
make install


Then compile an uptodate 2.6 kernel with:

make allmodconfig
make CC=/usr/local/gcc4/bin/gcc 2>&1 | tee LOG
grep warning LOG 

You'll see lots of warnings in LOG. Fix them all and submit patches
through the usual janitor channels.

-Andi


--===============012095844909482345==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============012095844909482345==--
