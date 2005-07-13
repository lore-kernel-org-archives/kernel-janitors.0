From: Domen Puncer <domen@coderock.org>
Date: Wed, 13 Jul 2005 18:31:20 +0000
Subject: [KJ] Importance of compile testing
Message-Id: <20050713183120.GF21831@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="4Ckj6UjgE2iN1+kY"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

After compile failures in patches from four different authors I
think it's time to repeat that compile tests are important for
patches.
Even when you do a simple fix, and you are sure nothing can go
wrong. Murphy's law applies here as well. :-)

I know it's easy to forget it, I sure have a couple of times.


I'm attaching a script I use for compile tests; yes it's stupid,
but it can catch warnings on other architecture even without
cross toolchains.
It assumes you are in kernel directory, and have already ran
"make" there. Takes only .bz2 patchsets, but that's trivial
to change.

When it finishes, you just type what the  last line says:
"diff -u out.clean out.kj | less -p '^\+'", look at warnings
and press 'n' till you get to the end.


	Domen

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=kj_compile_test

#!/bin/bash
if [ "$1" == "" ]; then
	echo "usage $0 patchset.bz2"
	exit 1
fi

# TODO test if applies cleanly, if right dir?

echo "[1/4] applying patch"
bzcat $1 | patch -sp1
echo "[2/4] compiling"
compile-test-bz-patchset $1 > out.kj
echo "[3/4] unapplying patch"
bzcat $1 | patch -sRp1
echo "[4/4] compiling"
compile-test-bz-patchset $1 > out.clean

echo "output in out.kj and out.clean"
echo "diff -u out.clean out.kj | less -p '^\+'"

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=compile-test-bz-patchset

#!/bin/bash
bzcat $@ | egrep '^\+\+\+' | cut -f1 | cut -f2- -d'/' | egrep '\.[chS]$' | sed 's/\.[chS]$/.o/' | xargs -n1 make 2>&1 | sed 's/:[0-9]\+:/:/g'

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--4Ckj6UjgE2iN1+kY--
