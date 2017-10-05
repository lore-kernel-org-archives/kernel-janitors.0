From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 05 Oct 2017 18:02:09 +0000
Subject: Re: [PATCH] coccinelle: api: detect duplicate chip data arrays
Message-Id: <CAK7LNAQK7w3FBxJUhX3Vn48XsUT7jQzGDC7kzCx2r-yWm0CdEw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1506861768-5734-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1506861768-5734-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

2017-10-01 21:42 GMT+09:00 Julia Lawall <Julia.Lawall@lip6.fr>:
> This semantic patch detects duplicate arrays declared using BQ27XXX_DATA
> within a single structure.  It is currently specific to the file
> drivers/power/supply/bq27xxx_battery.c.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---

Applied to linux-kbuild/misc.
Thanks.


-- 
Best Regards
Masahiro Yamada
