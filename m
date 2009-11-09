From: Hugh Dickins <hugh.dickins@tiscali.co.uk>
Date: Mon, 09 Nov 2009 10:51:03 +0000
Subject: Re: [PATCH] mm/ksm.c - Fix compile warnings (PS ignore my formatting
Message-Id: <Pine.LNX.4.64.0911091034120.15199@sister.anvils>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323584-287939173-1257763863=:15199"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1257317010.14838.55.camel@linux-k65f.site>  <4AF15022.1020408@bfs.de>
 <1257334139.14838.264.camel@linux-k65f.site>
In-Reply-To: <1257334139.14838.264.camel@linux-k65f.site>
To: askb <askb23@gmail.com>
Cc: wharms@bfs.de, Izik Eidus <ieidus@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323584-287939173-1257763863=:15199
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 4 Nov 2009, askb wrote:
> On Wed, 2009-11-04 at 10:57 +0100, walter harms wrote:
> >=20
> > askb schrieb:
> > > Found the compiler warning on linux-next: =09
> > >=20
> > > mm/ksm.c: In function =E2=80=98ksm_scan_thread=E2=80=99:
> > > mm/ksm.c:1083: warning: =E2=80=98page2[0u]=E2=80=99 may be used unini=
tialized in this
> > > function
> > > mm/ksm.c:1083: note: =E2=80=98page2[0u]=E2=80=99 was declared here
> > >=20
> > > fix for the above warning:
> > >=20
> > > Signed-off-by: Anil SB <askb23@gmail.com>
> > >=20
> > > diff --git a/mm/ksm.c b/mm/ksm.c
> > > index bef1af4..2ea0fd3 100644
> > > --- a/mm/ksm.c
> > > +++ b/mm/ksm.c
> > > @@ -1080,7 +1080,7 @@ static void stable_tree_append(struct rmap_item=
 *rmap_item,
> > >   */
> > >  static void cmp_and_merge_page(struct page *page, struct rmap_item *=
rmap_item)
> > >  {
> > > -=09struct page *page2[1];
> > > +=09struct page *page2[1] =3D {NULL};
> > >  =09struct rmap_item *tree_rmap_item;
> > >  =09unsigned int checksum;
> > >  =09int err;
> > >=20
> > >=20
> >=20
> > a 1 element array looks strange, did you look what kind of magic is her=
e used ?
> >=20
> >From my understanding, it is used for place holder to check and return
> an identical page from stable_tree_search(). Can we do with a double
> indirection to struct page instead of the above?=20
> PS point me in the right direction.

I don't particularly like things like page2[1] myself, but there's
nothing actually wrong with it, so no urgency to change it.

mm/ksm.c is under active development (better Cc the people involved
with a sourcefile when considering changes to it), and I have a
collection of patches under testing, which do change some names
around here (along with more serious changes).  So, thanks for looking
at this, but I'd prefer to avoid the interference of a trivial patch
at the moment - sorry.

Which version of the compiler gave you that uninitialized warning?
A version which lots of people are using, or just some snapshot?
I've never seen a warning there myself, but they do keep "refining"
that logic.

Hugh's hypothesis: for every variable x initialized by a subfunction,
there exists at least one version V of gcc, such that V reports that
x may be used uninitialized.

Hugh
--8323584-287939173-1257763863=:15199--
