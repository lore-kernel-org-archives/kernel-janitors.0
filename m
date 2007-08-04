From: Pierre Ossman <drzeus-mmc@drzeus.cx>
Date: Sat, 04 Aug 2007 13:01:45 +0000
Subject: Re: [PATCH 29] drivers/mmc/core/host.c: kmalloc + memset conversion
Message-Id: <20070804150145.08141a2c@poseidon.drzeus.cx>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
	<200707311953.17224.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311953.17224.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Tue, 31 Jul 2007 19:53:16 +0200
Mariusz Kozlowski <m.kozlowski@tuxland.pl> wrote:

> Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
> 
>  drivers/mmc/core/host.c | 3509 -> 3457 (-52 bytes)
>  drivers/mmc/core/host.o | 92400 -> 92136 (-264 bytes)
> 
>  drivers/mmc/core/host.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Acked-by: Pierre Ossman <drzeus@drzeus.cx>

-- 
     -- Pierre Ossman

  Linux kernel, MMC maintainer        http://www.kernel.org
  PulseAudio, core developer          http://pulseaudio.org
  rdesktop, core developer          http://www.rdesktop.org
