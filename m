From: Linus Walleij <linus.walleij@stericsson.com>
Date: Thu, 05 Aug 2010 21:41:03 +0000
Subject: Re: [spi-devel-general] [PATCH 26/42] drivers/spi/amba-pl022.c:
Message-Id: <AANLkTinCCrrdEXMTdPiFp4Y4gE4zqNVYQZFFSXWEmH-r@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <921858.63779.qm@web180313.mail.gq1.yahoo.com>
	<Pine.LNX.4.64.1008052235400.31692@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008052235400.31692-QfmoRoYWmW9knbxzx/v8hQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Cc: David Brownell <david-b-yBeKhBN/0LDR7s880joybQ@public.gmane.org>, spi-devel-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

2010/8/5 Julia Lawall <julia@diku.dk>:

> From: Julia Lawall <julia@diku.dk>
>
> The return -EINVAL appears to only make sense if the if branch that it is
> aligned with is taken, so move it into that branch

What a nasty bug to see, thanks for robot-finding this!
Acked-by: Linus Walleij <linus.walleij@stericsson.com>

Yours,
Linus Walleij
