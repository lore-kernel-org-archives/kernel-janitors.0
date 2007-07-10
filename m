From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 10 Jul 2007 23:42:18 +0000
Subject: Re: [PATCH] Remove BKL from PCI syscalls
Message-Id: <20070710234218.GS9704@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070710165532.GP9704@parisc-linux.org>
In-Reply-To: <20070710165532.GP9704@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Tue, Jul 10, 2007 at 05:36:47PM -0600, Matthew Wilcox wrote:
> On Tue, Jul 10, 2007 at 04:14:24PM -0700, Greg KH wrote:
> > What tree did you make this against?
>=20
> Linus' tree, as of this morning.

Looks like it's clashing with:

http://git.kernel.org/?p=3Dlinux/kernel/git/gregkh/patches.git;a=3Dblob;f=
=3Dpci/pci-syscall.c-switch-to-refcounting-api.patch;h=E513fc9669456ee08884=
c496ce4e6899c006dc7a;hb=3DHEAD

I believe my patch to be a superset of this one, and recommend just
dropping Alan's patch.

--=20
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
-
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
