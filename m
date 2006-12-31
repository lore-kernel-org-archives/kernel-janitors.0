From: "=?ISO-8859-1?Q?Daniel_Marjam=E4ki?=" <daniel.marjamaki@gmail.com>
Date: Sun, 31 Dec 2006 10:30:55 +0000
Subject: Re: [KJ] ok to replace with memcmp?
Message-Id: <80ec54e90612310230v27b0a517k837e2d718cfcb6f2@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <80ec54e90612300907k234d70bbsf36764dc87c43b9@mail.gmail.com>
In-Reply-To: <80ec54e90612300907k234d70bbsf36764dc87c43b9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hello!

I didn't know about the ARRAY_SIZE. But it doesn't seem to be usable
in this situation, does it?

flowi is a struct (defined in include/net/flow.h), not an array.

Best regards,
Daniel


2006/12/30, Robert P. J. Day <rpjday@mindspring.com>:
> On Sat, 30 Dec 2006, Daniel Marjam=E4ki wrote:
>
> > Hello friends!
> >
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
> >       flow_compare_t *k1, *k1_lim, *k2;
> >       const int n_elem =3D sizeof(struct flowi) / sizeof(flow_compare_t=
);
>
> don't use this sizeof/sizeof stuff to calculate the # of elements in
> an array.  kernel.h already defines an ARRAY_SIZE macro to do that.
>
> rday
>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
