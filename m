From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 12 Apr 2020 08:48:27 +0000
Subject: Re: [PATCH] spi: remove redundant assignment to variable ms
Message-Id: <CAMuHMdVCc34r0jHrn8GiJQCzvRSmUiZgN56D0c_KgSWN0e1W1g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200410122315.17523-1-colin.king@canonical.com>
In-Reply-To: <20200410122315.17523-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Mark Brown <broonie@kernel.org>, linux-spi <linux-spi@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Apr 10, 2020 at 2:23 PM Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable ms is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
