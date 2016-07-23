From: Evgeniy Polyakov <zbr@ioremap.net>
Date: Sat, 23 Jul 2016 04:40:17 +0000
Subject: Re: [PATCH 0/3] drivers: w1: coding style corrections
Message-Id: <69831469248817@web8g.yandex.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1469162015-10497-1-git-send-email-ben.werbowyj@gmail.com>
In-Reply-To: <1469162015-10497-1-git-send-email-ben.werbowyj@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hi Ben

22.07.2016, 07:34, "Ben Werbowyj" <ben.werbowyj@gmail.com>:
> Coding style corrections for the Dallas 1-Wire driver.
> Sections changed were reported by checkpatch.pl script.
> Broken up into separate patches to hopefully make checking/review
> a little easier. All three patches are for the w1_therm.c file
>
> Ben Werbowyj (3):
>   drivers: w1: style corrections for parenthesis and braces
>   drivers: w1: removed assignment from within if statement
>   drivers: w1: style corrections-pointers-blanklines-comparisons
>
>  drivers/w1/slaves/w1_therm.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)

Looks good to me, thank you
Acked-by: Evgeniy Polyakov <zbr@ioremap.net>
