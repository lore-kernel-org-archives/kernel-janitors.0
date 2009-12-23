From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Dec 2009 18:38:20 +0000
Subject: Re: [PATCH] char/vme_scc: adding __init macro to vme_scc.c
Message-Id: <10f740e80912231038r6d58cd34ke01051d82095f12c@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200908202242.31778.PeterHuewe@gmx.de>
In-Reply-To: <200908202242.31778.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Huewe <PeterHuewe@gmx.de>
Cc: Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>

On Thu, Aug 20, 2009 at 21:42, Peter Huewe <PeterHuewe@gmx.de> wrote:
> From: Peter Huewe <peterhuewe@gmx.de>
>
> Trivial patch which adds the __init macro to the module_init
> function and all of its helper functions of char/vme_scc.c
>
> Alan or Geert, please have a look at the small patch and either pull it through
> your tree, or please ack' it so Jiri can pull it through the trivial tree.

Thanks, applied.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
