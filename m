From: Tobias Klauser <tklauser@distanz.ch>
Date: Sun, 31 Dec 2006 11:25:32 +0000
Subject: Re: [KJ] ok to replace with memcmp?
Message-Id: <20061231112532.GG31196@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <80ec54e90612300907k234d70bbsf36764dc87c43b9@mail.gmail.com>
In-Reply-To: <80ec54e90612300907k234d70bbsf36764dc87c43b9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 2006-12-30 at 22:59:35 +0100, Robert P. J. Day <rpjday@mindspring.com> w=
rote:
> On Sat, 30 Dec 2006, Daniel Marjam=E4ki wrote:
> > I believe it should be possible to replace the code below with memcmp.
> > According to the comments, memcmp is not good in this case but I
> > believe it is. The code compares the data in 'key1' and 'key2', and
> > that is what memcmp is for. Do you have any comments?
> >
> > I haven't actually tested my change.
> >
> > Original code (net/core/flow.c):
> >
> > /* I hear what you're saying, use memcmp.  But memcmp cannot make
> >  * important assumptions that we can here, such as alignment and
> >  * constant size.
> >  */
> > static int flow_key_compare(struct flowi *key1, struct flowi *key2)
> > {
> > 	flow_compare_t *k1, *k1_lim, *k2;
> > 	const int n_elem =3D sizeof(struct flowi) / sizeof(flow_compare_t);
>=20
> don't use this sizeof/sizeof stuff to calculate the # of elements in
> an array.  kernel.h already defines an ARRAY_SIZE macro to do that.

ARRAY_SIZE won't work here as we would be using it against a struct, not
an array.

Cheers, Tobias

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
