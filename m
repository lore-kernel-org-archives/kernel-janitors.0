From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 04 Jun 2020 18:48:16 +0000
Subject: Re: [PATCH] ARM: socfpga: add missing put_device() call in socfpga_setup_ocram_self_refresh()
Message-Id: <22cf7c59-f689-f475-2170-48df94f671ee@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cb094a16-8017-704f-7811-530be8cfb16c@web.de>
In-Reply-To: <cb094a16-8017-704f-7811-530be8cfb16c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yu Kuai <yukuai3@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: Alan Tull <atull@opensource.altera.com>, Dinh Nguyen <dinguyen@kernel.org>, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Russell King <linux@armlinux.org.uk>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

> if of_find_device_by_node() succeed, socfpga_setup_ocram_self_refresh()
> doesn't have a corresponding put_device(). Thus add a jump target to fix
> the exception handling for this function implementation.

Do you find a previous update suggestion interesting?

ARM: socfpga: PM: Add missing put_device() call in socfpga_setup_ocram_self_refresh()
https://lore.kernel.org/linux-arm-kernel/c45a8e00-3fc9-adba-1a46-5f2c4149953e@web.de/
https://lore.kernel.org/patchwork/patch/1151166/
https://lkml.org/lkml/2019/11/9/156

Do you propose to adjust the source code a bit more?

Regards,
Markus
