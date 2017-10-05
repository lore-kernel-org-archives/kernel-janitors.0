From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Date: Thu, 05 Oct 2017 15:31:18 +0000
Subject: Re: [PATCH 0/5] CRIS v32: Adjustments for crisv32_nand_flash_probe()
Message-Id: <87bmllhard.fsf@free-electrons.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cd84411c-d202-70d6-dec2-c02bedaf3594@users.sourceforge.net>
In-Reply-To: <cd84411c-d202-70d6-dec2-c02bedaf3594@users.sourceforge.net> (SF
        Markus Elfring's message of "Wed, 4 Oct 2017 20:43:52 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-cris-kernel@axis.com, Alexander Sverdlin <alexander.sverdlin@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Krzysztof Halasa <khalasa@piap.pl>, Mikael Starvik <starvik@axis.com>, Neil Armstrong <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Markus,
 
 On mer., oct. 04 2017, SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 4 Oct 2017 20:33:20 +0200
>
> A few update suggestions were taken into account
> from static source code analysis.

If you plan to send a v2 could you remove me from the CC.

I know that ./scripts/get_maintainer.pl added my name but I am not
related at all to this code. I just gave my acked-by for a part of patch
which modified in the same time the file I care and many other files.

Thanks,

Greogry


>
> Markus Elfring (5):
>   Delete an error message for a failed memory allocation
>   Improve a size determination
>   Delete a jump target
>   Delete an unnecessary local variable
>   Split a condition check
>
>  arch/cris/arch-v32/drivers/mach-a3/nandflash.c | 17 ++++----------
>  arch/cris/arch-v32/drivers/mach-fs/nandflash.c | 31 ++++++++++++--------------
>  2 files changed, 18 insertions(+), 30 deletions(-)
>
> -- 
> 2.14.2
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
