From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Mon, 16 Mar 2020 09:28:38 +0000
Subject: Re: [PATCH][next] tools: gpio-hammer: fix spelling mistake: "occurences" -> "occurrences"
Message-Id: <CAMpxmJVxPzH1rhfKrGMHWAyKiPAy3CSx9xJqjw-2nKzy=-8ccg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200316092340.114125-1-colin.king@canonical.com>
In-Reply-To: <20200316092340.114125-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

pon., 16 mar 2020 o 10:23 Colin King <colin.king@canonical.com> napisa=C5=
=82(a):
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in an error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  tools/gpio/gpio-hammer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
> index 083399d276e4..28d2329e83d2 100644
> --- a/tools/gpio/gpio-hammer.c
> +++ b/tools/gpio/gpio-hammer.c
> @@ -153,7 +153,7 @@ int main(int argc, char **argv)
>
>         if (i >=3D GPIOHANDLES_MAX) {
>                 fprintf(stderr,
> -                       "Only %d occurences of '-o' are allowed, %d were =
found\n",
> +                       "Only %d occurrences of '-o' are allowed, %d were=
 found\n",
>                         GPIOHANDLES_MAX, i + 1);
>                 return -1;
>         }
> --
> 2.25.1
>

Patch applied, thanks!

Bartosz
