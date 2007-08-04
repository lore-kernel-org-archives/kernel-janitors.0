From: Pierre Ossman <drzeus-mmc@drzeus.cx>
Date: Sat, 04 Aug 2007 13:02:04 +0000
Subject: Re: [PATCH 49] drivers/mmc/core/mmc_ops.c: kmalloc + memset
Message-Id: <20070804150204.6c1d8801@poseidon.drzeus.cx>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
	<200707312050.13687.m.kozlowski@tuxland.pl>
In-Reply-To: <200707312050.13687.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Tue, 31 Jul 2007 20:50:13 +0200
Mariusz Kozlowski <m.kozlowski@tuxland.pl> wrote:

> Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
> 
>  drivers/mmc/core/mmc_ops.c | 7957 -> 7924 (-33 bytes)
>  drivers/mmc/core/mmc_ops.o | 101732 -> 101744 (+12 bytes)
> 
>  drivers/mmc/core/mmc_ops.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Acked-by: Pierre Ossman <drzeus@drzeus.cx>

-- 
     -- Pierre Ossman

  Linux kernel, MMC maintainer        http://www.kernel.org
  PulseAudio, core developer          http://pulseaudio.org
  rdesktop, core developer          http://www.rdesktop.org
