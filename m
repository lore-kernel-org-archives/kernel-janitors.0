From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 01 Mar 2004 09:42:09 +0000
Subject: [Kernel-janitors] Re: finding unused globals in the kernel
Message-Id: <200403011042.10099.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5138.1078121472@kao2.melbourne.sgi.com>
In-Reply-To: <5138.1078121472@kao2.melbourne.sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Keith Owens <kaos@ocs.com.au>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

On Monday 01 March 2004 07:11, Keith Owens wrote:
> It is a bit harder than a simple compare. =A0EXPORT_SYMBOL(foo) generates
> a reference to foo even if nothing uses it, which hides unused
> variables. =A0Certain symbols appear as unused but are really used by the
> 2.4 version of insmod. =A0Your script does not handle modules at all.
>=20
> namespace.pl below handles all the special cases on kernels from 2.0
> through 2.4. =A0It needs updating for 2.6 kernels, enjoy.

Well, your script is about a related, but still different question.
namespace.pl apparently gives a list of symbols that could/should have=20
been marked static because they are not referenced outside of their
files. I have another script that does this as well, though yours
is a lot better at it.

The question that my checkunused.sh is trying to answer is which symbols=20
are never referenced at all and therefore could be removed from the=20
kernel binary. I intentionally kept the references from EXPORT_SYMBOL,
because I didn't want to think about whether there might be modules
using them.

Finding exported symbols that no module in the tree uses is yet
another problem. Your namespace.pl does this on object files, but
using cscope at source level could perhaps do this better.

	Arnd <><

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
