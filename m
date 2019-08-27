From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Aug 2019 13:31:15 +0000
Subject: Re: [PATCH] clk: renesas: mstp: Delete an unnecessary kfree() call in cpg_mstp_clocks_init()
Message-Id: <CAMuHMdVCcHn1YHFhehkvNV29s5jCDDsDWBOkVcWmf1XBPRdfYg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e66b822b-026b-29cc-e461-6334aafd1d30@web.de>
In-Reply-To: <e66b822b-026b-29cc-e461-6334aafd1d30@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-clk <linux-clk@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Aug 27, 2019 at 3:27 PM Markus Elfring <Markus.Elfring@web.de> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 27 Aug 2019 15:22:12 +0200
>
> A null pointer would be passed to a call of the function “kfree”
> directly after a call of the function “kzalloc” failed at one place.
> Remove this superfluous function call.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
