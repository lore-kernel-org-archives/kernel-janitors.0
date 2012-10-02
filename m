From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 02 Oct 2012 08:11:16 +0000
Subject: Re: ERROR: "irq_set_chip_and_handler_name" undefined!
Message-Id: <87a9w55m5a.wl%kuninori.morimoto.gx@renesas.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121002075148.GD24180@localhost>
In-Reply-To: <20121002075148.GD24180@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi Fengguang

Thank you for your report

> commit 6e20a0a429bd4dc07d6de16d9c247270e04e4aa0
> Author:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Commit:     Linus Walleij <linus.walleij@linaro.org>
> CommitDate: Thu Aug 23 23:41:17 2012 +0200
> 
>     gpio: pcf857x: enable gpio_to_irq() support
> 
> config: x86_64-allmodconfig
> 
> All error/warnings:
> 
> ERROR: "irq_set_chip_and_handler_name" undefined!
> ERROR: "dummy_irq_chip" undefined!

I believe this issue was solved by these patches

  http://git.kernel.org/tip/17d83127d4c2b322dd8f217e0ac08c66eb403779
  http://git.kernel.org/tip/b3ae66f209e8929db62b5a5f874ab2cdcf5ef1d4

or

17d8312		genirq: Export dummy_irq_chip
b3ae66f		genirq: Export irq_set_chip_and_handler_name()
