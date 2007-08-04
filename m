From: Pierre Ossman <drzeus-mmc@drzeus.cx>
Date: Sat, 04 Aug 2007 13:01:29 +0000
Subject: Re: [PATCH 05] drivers/mmc/core/bus.c: kmalloc + memset conversion
Message-Id: <20070804150129.0a1234cf@poseidon.drzeus.cx>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
	<200707311900.00143.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311900.00143.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Tue, 31 Jul 2007 18:59:59 +0200
Mariusz Kozlowski <m.kozlowski@tuxland.pl> wrote:

> Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
> 
>  drivers/mmc/core/bus.c | 5663 -> 5619 (-44 bytes)
>  drivers/mmc/core/bus.o | 70899 -> 70731 (-168 bytes)
> 
>  drivers/mmc/core/bus.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Acked-by: Pierre Ossman <drzeus@drzeus.cx>


-- 
     -- Pierre Ossman

  Linux kernel, MMC maintainer        http://www.kernel.org
  PulseAudio, core developer          http://pulseaudio.org
  rdesktop, core developer          http://www.rdesktop.org
