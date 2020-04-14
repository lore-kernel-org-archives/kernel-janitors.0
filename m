From: Robert Richter <rrichter@marvell.com>
Date: Tue, 14 Apr 2020 09:46:23 +0000
Subject: Re: [PATCH] EDAC/armada_xp: Fix some log messages
Message-Id: <20200414094622.45hrvmf6lz24trgx@rric.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200413041556.3514-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200413041556.3514-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: jlu@pengutronix.de, bp@alien8.de, mchehab@kernel.org, tony.luck@intel.com, james.morse@arm.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 13.04.20 06:15:56, Christophe JAILLET wrote:
> Fix some spelling (s/Aramda/Armada/) in 1 log message and in 1 comment.
> 
> While at it, add some trailing '\n' in some other log message.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Robert Richter <rrichter@marvell.com>

> ---
>  drivers/edac/armada_xp_edac.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Note there are some other "Aramda" occurrences in the kernel:

linux/master:Documentation/devicetree/bindings/rtc/armada-380-rtc.txt:  "marvell,armada-8k-rtc" for Aramda 7K/8K SoCs
linux/master:arch/arm64/boot/dts/marvell/armada-8020.dtsi:/* The RTC requires external oscillator. But on Aramda 80x0, the RTC clock
linux/master:arch/arm64/boot/dts/marvell/armada-8040.dtsi:/* The RTC requires external oscillator. But on Aramda 80x0, the RTC clock
linux/master:drivers/mtd/nand/raw/Kconfig:        - 64-bit Aramda platforms (7k, 8k) (NFCv2)

Thanks,

-Robert
