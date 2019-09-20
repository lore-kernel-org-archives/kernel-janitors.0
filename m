From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Sep 2019 13:38:22 +0000
Subject: Re: [PATCH] media: platform: Use devm_platform_ioremap_resource() in two functions
Message-Id: <CAMuHMdVD4ktoacaqWSRxGehmO3ULrcFXCSTQ=JaxrUWhCTw-Lg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d80a685a-c3de-b9c9-ad32-e1da9308c393@web.de>
In-Reply-To: <d80a685a-c3de-b9c9-ad32-e1da9308c393@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, linux-mediatek@lists.infradead.org, Himanshu Jha <himanshujha199640@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Media Mailing List <linux-media@vger.kernel.org>

On Wed, Sep 18, 2019 at 11:30 AM Markus Elfring <Markus.Elfring@web.de> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2019 11:20:48 +0200
>
> Simplify these function implementations by using a known wrapper function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
