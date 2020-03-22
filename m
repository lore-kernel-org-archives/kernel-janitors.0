From: Jiri Kosina <jikos@kernel.org>
Date: Sun, 22 Mar 2020 21:42:56 +0000
Subject: Re: [PATCH] err.h: remove deprecated PTR_RET for good
Message-Id: <nycvar.YFH.7.76.2003222240500.19500@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200322165702.6712-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200322165702.6712-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Andrew Morton <akpm@linux-foundation.org>, "Gustavo A . R . Silva" <gustavo@embeddedor.com>, Nicholas Krause <xerofoify@gmail.com>, Duan Jiong <duanj.fnst@cn.fujitsu.com>, Sachin Kamat <sachin.kamat@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 22 Mar 2020, Lukas Bulwahn wrote:

> Initially, commit fa9ee9c4b988 ("include/linux/err.h: add a function to
> cast error-pointers to a return value") from Uwe Kleine-K=C3=B6nig introd=
uced
> PTR_RET in 03/2011. Then, in 07/2013, commit 6e8b8726ad50 ("PTR_RET is
> now PTR_ERR_OR_ZERO") from Rusty Russell renamed PTR_RET to
> PTR_ERR_OR_ZERO, and left PTR_RET as deprecated-marked alias.
>=20
> After six years since the renaming and various repeated cleanups in the
> meantime, it is time to finally remove the deprecated PTR_RET for good.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Rusty, if you are still around, Acked-by is appreciated.
> Uwe, Acked-by is appreciated.
> Kudos to Gustavo, Nicholas, Duan & Sachin for previous cleanups.
>=20
> applies cleanly on current master and on next-20200320
> Jiri, please pick this trival patch for the next merge window. Thanks.

I am queuing it right away; it's been marked deprecated back in 2013, and=20
it doesn't have any in-tree users anyway.

Thanks,

--=20
Jiri Kosina
SUSE Labs
