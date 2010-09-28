From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Date: Tue, 28 Sep 2010 13:02:14 +0000
Subject: Re: [PATCH 13/24] misc: change to new flag variable
Message-Id: <20100928130214.GC3388@rere.qmqm.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e0bdab5d2e8c52041c003de68ba774c3e706716c.1285355033.git.mfm@muteddisk.com> <c2f1ef5590660ae574e9bdaf7136213741081404.1285355033.git.mfm@muteddisk.com>
In-Reply-To: <c2f1ef5590660ae574e9bdaf7136213741081404.1285355033.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: matt mooney <mfm@muteddisk.com>
Cc: kernel-janitors@vger.kernel.org, Jack Steiner <steiner@sgi.com>, linux-kernel@vger.kernel.org

On Fri, Sep 24, 2010 at 12:17:23PM -0700, matt mooney wrote:
> Replace EXTRA_CFLAGS with ccflags-y.
>=20
> Signed-off-by: matt mooney <mfm@muteddisk.com>
> ---
>  drivers/misc/cb710/Makefile   |    4 +---
>  drivers/misc/sgi-gru/Makefile |    4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/misc/cb710/Makefile b/drivers/misc/cb710/Makefile
> index 7b80cbf..467c8e9 100644
> --- a/drivers/misc/cb710/Makefile
> +++ b/drivers/misc/cb710/Makefile
> @@ -1,6 +1,4 @@
> -ifeq ($(CONFIG_CB710_DEBUG),y)
> -	EXTRA_CFLAGS		+=3D -DDEBUG
> -endif
> +ccflags-$(CONFIG_CB710_DEBUG)	:=3D -DDEBUG
> =20
>  obj-$(CONFIG_CB710_CORE)	+=3D cb710.o
> =20

In case you need it:

Acked-by: Micha=B3 Miros=B3aw <mirq-linux@rere.qmqm.pl>

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
