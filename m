From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 27 Feb 2009 01:00:46 +0000
Subject: Re: [PATCH 05/16] dvb: fix sparse warnings: Using plain integer as
Message-Id: <154e089b0902261700j4131b0feq8f0e29885a833590@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
	 <20090222000204.17557.99725.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090222000204.17557.99725.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: trivial@kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

[Added To]

On Sun, Feb 22, 2009 at 1:02 AM, Hannes Eder <hannes@hanneseder.net> wrote:
> Fix this sparse warnings:
> =A0drivers/media/dvb/frontends/drx397xD_fw.h:21:2: warning: Using plain i=
nteger as NULL pointer
> =A0drivers/media/dvb/frontends/drx397xD_fw.h:22:2: warning: Using plain i=
nteger as NULL pointer
>
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
> =A0drivers/media/dvb/frontends/drx397xD.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/media/dvb/frontends/drx397xD.c b/drivers/media/dvb/f=
rontends/drx397xD.c
> index 1e81e71..172f1f9 100644
> --- a/drivers/media/dvb/frontends/drx397xD.c
> +++ b/drivers/media/dvb/frontends/drx397xD.c
> @@ -74,7 +74,7 @@ static struct {
> =A0} fw[] =3D {
> =A0#define _FW_ENTRY(a, b, c) =A0 =A0 { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D a, =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .file =A0 =3D 0, =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .file =A0 =3D NULL, =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.lock =A0 =3D __RW_LOCK_UN=
LOCKED(fw[c].lock), =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.refcnt =3D 0, =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.data =A0 =3D { } =A0 =A0 =
=A0 =A0 =A0 }
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
