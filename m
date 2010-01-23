From: Tomas Winkler <tomasw@gmail.com>
Date: Sat, 23 Jan 2010 19:43:32 +0000
Subject: Re: [PATCH 2/9] drivers/misc: Eliminate useless code
Message-Id: <1ba2fa241001231143l595f2861kda19831ffa1da2cd@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1001161657170.28745@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1001161657170.28745@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jan 16, 2010 at 5:57 PM, Julia Lawall <julia@diku.dk> wrote:
> From: Julia Lawall <julia@diku.dk>
>
> The variable priv is initialized twice to the same (side effect-free)
> expression. =C2=A0Drop one initialization.
>
> A simplified version of the semantic match that finds this problem is:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @forall@
> idexpression *x;
> identifier f!=3DERR_PTR;
> @@
>
> x =3D f(...)
> ... when !=3D x
> (
> x =3D f(...,<+...x...+>,...)
> |
> * x =3D f(...)
> )
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
Acked-by Tomas.Winker <tomas.winkler@intel.com>


I appreciate if you CC me next time.

Thanks
Tomas
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
