From: Will Newton <will.newton@gmail.com>
Date: Wed, 08 Apr 2009 14:05:43 +0000
Subject: Re: [PATCH 20/56] inflate: Remove void casts
Message-Id: <87a5b0800904080705n74829b75l8becfd6e7d1a321f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-15-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-16-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-17-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-18-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-19-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-20-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-21-git-send-email-jwjstone@fastmail.fm>
	 <36ca99e90904080439u7098d2feka5dd39f8ab6a470c@mail.gmail.com>
	 <49DCAC88.7010500@fastmail.fm>
In-Reply-To: <49DCAC88.7010500@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jack Stone <jwjstone@fastmail.fm>
Cc: Bert Wesarg <bert.wesarg@googlemail.com>, linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

On Wed, Apr 8, 2009 at 2:54 PM, Jack Stone <jwjstone@fastmail.fm> wrote:
> Heres the fixed patch
>
> Thanks,
>
> Jack
>
> --
>
> inflate: Remove void casts
>
> From: Jack Stone <jwjstone@fastmail.fm>
>
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>
> =A0lib/inflate.c | =A0 =A05 ++---
> =A01 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/lib/inflate.c b/lib/inflate.c
> index 1a8e8a9..1eb0cd8 100644
> --- a/lib/inflate.c
> +++ b/lib/inflate.c
> @@ -249,7 +249,7 @@ static void *malloc(int size)
>
> =A0 =A0 =A0 =A0malloc_ptr =3D (malloc_ptr + 3) & ~3; =A0 =A0 /* Align */
>
> - =A0 =A0 =A0 p =3D (void *)malloc_ptr;
> + =A0 =A0 =A0 p =3D malloc_ptr;
> =A0 =A0 =A0 =A0malloc_ptr +=3D size;

Won't this cause a "assignment makes pointer from integer without a
cast" warning?

> =A0 =A0 =A0 =A0if (free_mem_end_ptr && malloc_ptr >=3D free_mem_end_ptr)
> @@ -481,8 +481,7 @@ DEBG1("3 ");
> =A0 =A0 =A0 =A0 z =3D 1 << j; =A0 =A0 =A0 =A0 =A0 =A0 /* table entries fo=
r j-bit table */
>
> =A0 =A0 =A0 =A0 /* allocate and link in new table */
> - =A0 =A0 =A0 =A0if ((q =3D (struct huft *)malloc((z + 1)*sizeof(struct h=
uft))) =3D
> - =A0 =A0 =A0 =A0 =A0 =A0(struct huft *)NULL)
> + =A0 =A0 =A0 =A0if ((q =3D malloc((z + 1)*sizeof(struct huft))) =3D NULL)
> =A0 =A0 =A0 =A0 {
> =A0 =A0 =A0 =A0 =A0 if (h)
> =A0 =A0 =A0 =A0 =A0 =A0 huft_free(u[0]);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
