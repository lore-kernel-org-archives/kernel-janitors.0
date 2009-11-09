From: Hugh Dickins <hugh.dickins@tiscali.co.uk>
Date: Mon, 09 Nov 2009 15:54:00 +0000
Subject: Re: [PATCH] mm/ksm.c - Fix compile warnings (PS ignore my formatting
Message-Id: <Pine.LNX.4.64.0911091546090.24767@sister.anvils>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323584-957890546-1257782040=:24767"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1257317010.14838.55.camel@linux-k65f.site>  <4AF15022.1020408@bfs.de>
 <1257334139.14838.264.camel@linux-k65f.site>  <Pine.LNX.4.64.0911091034120.15199@sister.anvils>
 <1257774331.5381.70.camel@linux-k65f.site>
In-Reply-To: <1257774331.5381.70.camel@linux-k65f.site>
To: askb <askb23@gmail.com>
Cc: wharms@bfs.de, Izik Eidus <ieidus@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323584-957890546-1257782040=:24767
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 9 Nov 2009, askb wrote:
> On Mon, 2009-11-09 at 10:51 +0000, Hugh Dickins wrote:
> > On Wed, 4 Nov 2009, askb wrote:
> > > On Wed, 2009-11-04 at 10:57 +0100, walter harms wrote:
> > > > askb schrieb:
> > > > > Found the compiler warning on linux-next: =09
> > > > >=20
> > > > > mm/ksm.c: In function =E2=80=98ksm_scan_thread=E2=80=99:
> > > > > mm/ksm.c:1083: warning: =E2=80=98page2[0u]=E2=80=99 may be used u=
ninitialized in this
> > > > > function
> > > > > mm/ksm.c:1083: note: =E2=80=98page2[0u]=E2=80=99 was declared her=
e
=2E..
> > Which version of the compiler gave you that uninitialized warning?
>=20
> gcc version 4.3.2 [gcc-4_3-branch revision 141291] (SUSE Linux)

Thanks: funny, that's the one I've been using most too.

>=20
> > A version which lots of people are using, or just some snapshot?
> > I've never seen a warning there myself, but they do keep "refining"
> > that logic.
> >=20
> I got the warning while doing "make randconfig". However, now after a
> cleanup and redoing the same, the warning is not seen.

I just tried the most obvious alternatives (CC_OPTIMIZE_FOR_SIZE,
OPTIMIZE_INLINING, off and on), but still didn't see the warning.

Never mind, I've shoved a NULL in my tree, but no rush for this.

Hugh
--8323584-957890546-1257782040=:24767--
