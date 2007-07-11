From: Matthew Wilcox <matthew@wil.cx>
Date: Wed, 11 Jul 2007 20:20:54 +0000
Subject: Re: [PATCH] Remove BKL from PCI syscalls
Message-Id: <20070711202054.GV9704@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070710165532.GP9704@parisc-linux.org>
In-Reply-To: <20070710165532.GP9704@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Tue, Jul 10, 2007 at 05:30:01PM -0700, Greg KH wrote:
> On Tue, Jul 10, 2007 at 06:16:14PM -0600, Matthew Wilcox wrote:
> > On Tue, Jul 10, 2007 at 04:49:36PM -0700, Greg KH wrote:
> > > On Tue, Jul 10, 2007 at 05:42:18PM -0600, Matthew Wilcox wrote:
> > > > I believe my patch to be a superset of this one, and recommend just
> > > > dropping Alan's patch.
> > >=20
> > > How about just doing your patch on top of Alan's instead?
> >=20
> > Seems like a lot more work; wasn't the point of keeping patches in a git
> > tree like this to make it easy to drop old patches?  I'd understand if
> > it meant pulling apart and rebasing a git tree.
>=20
> Well, it depends.  Alan's patch fixes up the api to do the proper thing
> now, and your patch builds on that showing that we can now just drop the
> BKL safely.  They are two different things in a way as is shown by the
> fact that two different people approached this differently :)

I suppose that's one way of looking at it.  It just feels wrong -- git
is supposed to show how development happened, and I didn't base my patch
on Alan's.

It sucks that Alan sent his patch three months ago and it
still didn't make it into the 2.6.22 release.  It's not even
controversial.  Indeed, as far as I can tell, it didn't even
make it into your tree until *after* I'd sent off this patch yesterday!
http://git.kernel.org/?p=3Dlinux/kernel/git/gregkh/patches.git;a=3Dcommit;h=
=DE575d18a94e63c681435a16f5c72a3c13dd3345
is why I think that -- please tell me if I'm confused.

> Also, Alan's patch has already gotten a lot of testing in -mm for a
> while and is about to be sent to Linus, while your's would be a bit
> further back in the queue.

How much testing has Alan's patch actually had?  This file isn't even
built on x86, and I don't believe there's any userspace actually using
these syscalls.  lspci (and other libpci users) don't have the syscalls
as an access method.  I believe the only user was X, and I don't think X
uses these syscalls any more.

<ajax> looks like they're referenced in the alpha pci code, but i have
no idea if that crap gets called anymore
<ajax> the generic code uses sysfs

So is there anyone testing -mm on Alpha, and running X?

--=20
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
-
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
