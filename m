From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Dec 2020 07:31:56 +0000
Subject: Re: [PATCH] media: vsp1: Fix an error handling path in the probe function
Message-Id: <CAMuHMdUJVN3ywmSfCDKT05k24hxNtn5C8TdO6nyscUFiCy441w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201212174119.120027-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201212174119.120027-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, Dec 13, 2020 at 5:22 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
> A previous 'rcar_fcp_get()' call must be undone in the error handling path,
> as already done in the remove function.
>
> Fixes: 94fcdf829793 ("[media] v4l: vsp1: Add FCP support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
