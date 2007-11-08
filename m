From: Hirokazu Takata <takata@linux-m32r.org>
Date: Thu, 08 Nov 2007 11:38:52 +0000
Subject: Re: [PATCH] M32R - remove dead config symbols from M32R code
Message-Id: <swfk5ot0xwz.wl%takata.hirokazu@renesas.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4732F322.8040008@gmail.com>
In-Reply-To: <4732F322.8040008@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Jiri Olsa <olsajiri@gmail.com>
Subject: [PATCH] M32R - remove dead config symbols from M32R code
Date: Thu, 08 Nov 2007 12:29:38 +0100
> remove dead config symbols from M32R code
> Signed-off-by: Jiri Olsa <olsajiri@gmail.com>
> 
> ---
>  arch/m32r/boot/compressed/m32r_sio.c     |    4 ++--
>  include/asm-m32r/irq.h                   |    2 +-
>  include/asm-m32r/m32700ut/m32700ut_pld.h |    4 +---
>  3 files changed, 4 insertions(+), 6 deletions(-)
> 

It looks fine to me.

Acked-by: Hirokazu Takata <takata@linux-m32r.org>

Thank you.

--
Hirokazu Takata <takata@linux-m32r.org>
Linux/M32R Project:  http://www.linux-m32r.org/
