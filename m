From: Greg KH <greg@kroah.com>
Date: Wed, 11 Jul 2007 20:59:27 +0000
Subject: Re: [PATCH] Remove BKL from PCI syscalls
Message-Id: <20070711205927.GA22475@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070710165532.GP9704@parisc-linux.org>
In-Reply-To: <20070710165532.GP9704@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, Jul 11, 2007 at 02:20:54PM -0600, Matthew Wilcox wrote:
> On Tue, Jul 10, 2007 at 05:30:01PM -0700, Greg KH wrote:
> > On Tue, Jul 10, 2007 at 06:16:14PM -0600, Matthew Wilcox wrote:
> > > On Tue, Jul 10, 2007 at 04:49:36PM -0700, Greg KH wrote:
> > > > On Tue, Jul 10, 2007 at 05:42:18PM -0600, Matthew Wilcox wrote:
> > > > > I believe my patch to be a superset of this one, and recommend ju=
st
> > > > > dropping Alan's patch.
> > > >=20
> > > > How about just doing your patch on top of Alan's instead?
> > >=20
> > > Seems like a lot more work; wasn't the point of keeping patches in a =
git
> > > tree like this to make it easy to drop old patches?  I'd understand if
> > > it meant pulling apart and rebasing a git tree.
> >=20
> > Well, it depends.  Alan's patch fixes up the api to do the proper thing
> > now, and your patch builds on that showing that we can now just drop the
> > BKL safely.  They are two different things in a way as is shown by the
> > fact that two different people approached this differently :)
>=20
> I suppose that's one way of looking at it.  It just feels wrong -- git
> is supposed to show how development happened, and I didn't base my patch
> on Alan's.
>=20
> It sucks that Alan sent his patch three months ago and it
> still didn't make it into the 2.6.22 release.  It's not even
> controversial.  Indeed, as far as I can tell, it didn't even
> make it into your tree until *after* I'd sent off this patch yesterday!
> http://git.kernel.org/?p=3Dlinux/kernel/git/gregkh/patches.git;a=3Dcommit=
;h=DE575d18a94e63c681435a16f5c72a3c13dd3345
> is why I think that -- please tell me if I'm confused.

Yes, that is because Alan sent it to Andrew and not me, so it was in the
-mm tree for a while before Andrew sent it on to me.

> > Also, Alan's patch has already gotten a lot of testing in -mm for a
> > while and is about to be sent to Linus, while your's would be a bit
> > further back in the queue.
>=20
> How much testing has Alan's patch actually had?

As much testing as any -mm release does :)

> So is there anyone testing -mm on Alpha, and running X?

I do not know, try asking on lkml.

thanks,

greg k-h
-
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
