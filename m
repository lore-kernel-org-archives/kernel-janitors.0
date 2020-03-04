From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 04 Mar 2020 22:14:30 +0000
Subject: Re: AW: [PATCH 5.5 110/176] MIPS: VPE: Fix a double free and a memory leak in release_vpe()
Message-Id: <33446ca8-0ace-e081-47fa-ceddf7fe80df@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200303174304.593872177@linuxfoundation.org>
 <20200303174317.555620066@linuxfoundation.org>
 <adf1859b4dcc497285ebbda017ece22d@bfs.de>
In-Reply-To: <adf1859b4dcc497285ebbda017ece22d@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Walter Harms <wharms@bfs.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, Paul Burton <paulburton@kernel.org>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Le 04/03/2020 à 22:28, Walter Harms a écrit :
> ________________________________________
> Von: kernel-janitors-owner@vger.kernel.org <kernel-janitors-owner@vger.kernel.org> im Auftrag von Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Gesendet: Dienstag, 3. März 2020 18:42
> An: linux-kernel@vger.kernel.org
> Cc: Greg Kroah-Hartman; stable@vger.kernel.org; Christophe JAILLET; Paul Burton; ralf@linux-mips.org; linux-mips@vger.kernel.org; kernel-janitors@vger.kernel.org
> Betreff: [PATCH 5.5 110/176] MIPS: VPE: Fix a double free and a memory leak in release_vpe()
>
> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>
> commit bef8e2dfceed6daeb6ca3e8d33f9c9d43b926580 upstream.
>
> Pointer on the memory allocated by 'alloc_progmem()' is stored in
> 'v->load_addr'. So this is this memory that should be freed by
> 'release_progmem()'.
>
> 'release_progmem()' is only a call to 'kfree()'.
>
> With the current code, there is both a double free and a memory leak.
> Fix it by passing the correct pointer to 'release_progmem()'.
>
> Fixes: e01402b115ccc ("More AP / SP bits for the 34K, the Malta bits and things. Still wants")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Paul Burton <paulburton@kernel.org>
> Cc: ralf@linux-mips.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kernel-janitors@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> ---
>   arch/mips/kernel/vpe.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- a/arch/mips/kernel/vpe.c
> +++ b/arch/mips/kernel/vpe.c
> @@ -134,7 +134,7 @@ void release_vpe(struct vpe *v)
>   {
>          list_del(&v->list);
>          if (v->load_addr)
> -               release_progmem(v);
> +               release_progmem(v->load_addr);
>          kfree(v);
>   }
>
>
> since release_progmem() is kfree() it is also possible to drop "if (v->load_addr)"
>
> jm2c
>
> re,
>   wh

Agreed.

My patch had the following comment after the patch description:
---
The 'if (v->load_addr)' looks also redundant, but, well, the code is old
and I feel lazy tonight to send another patch for only that.
---

git log shows nearly no update since end of 2015, so I kept my proposal 
as minimal :)

CJ
