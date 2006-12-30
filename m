From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 30 Dec 2006 21:59:35 +0000
Subject: Re: [KJ] ok to replace with memcmp?
Message-Id: <Pine.LNX.4.64.0612301658350.16056@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-109154356-1167515975=:16056"
List-Id: <kernel-janitors.vger.kernel.org>
References: <80ec54e90612300907k234d70bbsf36764dc87c43b9@mail.gmail.com>
In-Reply-To: <80ec54e90612300907k234d70bbsf36764dc87c43b9@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-109154356-1167515975=:16056
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sat, 30 Dec 2006, Daniel Marjam=E4ki wrote:

> Hello friends!
>
> I believe it should be possible to replace the code below with memcmp.
> According to the comments, memcmp is not good in this case but I
> believe it is. The code compares the data in 'key1' and 'key2', and
> that is what memcmp is for. Do you have any comments?
>
> I haven't actually tested my change.
>
> Original code (net/core/flow.c):
>
> /* I hear what you're saying, use memcmp.  But memcmp cannot make
>  * important assumptions that we can here, such as alignment and
>  * constant size.
>  */
> static int flow_key_compare(struct flowi *key1, struct flowi *key2)
> {
> 	flow_compare_t *k1, *k1_lim, *k2;
> 	const int n_elem =3D sizeof(struct flowi) / sizeof(flow_compare_t);

don't use this sizeof/sizeof stuff to calculate the # of elements in
an array.  kernel.h already defines an ARRAY_SIZE macro to do that.

rday
--8323328-109154356-1167515975=:16056
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--8323328-109154356-1167515975=:16056--
