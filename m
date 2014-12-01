From: Mike Snitzer <snitzer@redhat.com>
Date: Mon, 01 Dec 2014 23:00:38 +0000
Subject: Re: [PATCH 5/8 v2] dm: replace memset by memzero_explicit
Message-Id: <20141201230037.GA9761@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417367029-32762-1-git-send-email-Julia.Lawall@lip6.fr>
 <1417367029-32762-6-git-send-email-Julia.Lawall@lip6.fr>
 <547CD7B9.5030000@gmail.com>
In-Reply-To: <547CD7B9.5030000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Milan Broz <gmazyland@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>, dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>

On Mon, Dec 01 2014 at  4:03pm -0500,
Milan Broz <gmazyland@gmail.com> wrote:

> On 11/30/2014 06:03 PM, Julia Lawall wrote:
> > From: Julia Lawall <Julia.Lawall@lip6.fr>
> >=20
> > Memset on a local variable may be removed when it is called just before=
 the
> > variable goes out of scope.  Using memzero_explicit defeats this
> > optimization.  A simplified version of the semantic patch that makes th=
is
> > change is as follows: (http://coccinelle.lip6.fr/)
>=20
> Ack, but I submitted the same patch a week ago....
>=20
> https://www.redhat.com/archives/dm-devel/2014-November/msg00084.html
>=20
> Mike, please could you add this to linux-next tree or you want this
> to go through Herbert's tree?
> (I do not think it is good idea for DM patches.)

I staged it in linux-next for 3.19 inclusion, see:
https://git.kernel.org/cgit/linux/kernel/git/device-mapper/linux-dm.git/com=
mit/?h=3Ddm-for-3.19&id=A722201f9075b28be140bc13f8ec07bf6a42edd4
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
