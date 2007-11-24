From: Pierre Ossman <drzeus-mmc@drzeus.cx>
Date: Sat, 24 Nov 2007 14:36:50 +0000
Subject: Re: [PATCH] sdio_uart: fix sign of paramter status in
Message-Id: <20071124153650.27a572a6@poseidon.drzeus.cx>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11956448251191-git-send-email-andre@bitwigglers.org>
In-Reply-To: <11956448251191-git-send-email-andre@bitwigglers.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nico@cam.org
Cc: Andre Haupt <andre@bitwigglers.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.orgAndre Haupt <andre@bitwigglers.org>

On Wed, 21 Nov 2007 12:33:45 +0100
Andre Haupt <andre@bitwigglers.org> wrote:

> I think, the status paramter should be unsigned. Is this correct?
> This also fixes a sparse warning about different signedness.
> Only compile tested, because i do not have the hardware.
> 
> From: Andre Haupt <andre@bitwigglers.org>
> Signed-off-by: Andre Haupt <andre@bitwigglers.org>

Nicolas, does this seem correct to you? I'm not familiar with the serial stuff.

Rgds
-- 
     -- Pierre Ossman

  Linux kernel, MMC maintainer        http://www.kernel.org
  PulseAudio, core developer          http://pulseaudio.org
  rdesktop, core developer          http://www.rdesktop.org
