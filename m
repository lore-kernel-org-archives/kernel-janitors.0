From: Nicolas Pitre <nico@cam.org>
Date: Sat, 24 Nov 2007 15:35:44 +0000
Subject: Re: [PATCH] sdio_uart: fix sign of paramter status in
Message-Id: <alpine.LFD.0.99999.0711241029010.9605@xanadu.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11956448251191-git-send-email-andre@bitwigglers.org>
 <20071124153650.27a572a6@poseidon.drzeus.cx>
In-Reply-To: <20071124153650.27a572a6@poseidon.drzeus.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre Ossman <drzeus-mmc@drzeus.cx>
Cc: Andre Haupt <andre@bitwigglers.org>, lkml <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.orgAndre Haupt <andre@bitwigglers.org>

On Sat, 24 Nov 2007, Pierre Ossman wrote:

> On Wed, 21 Nov 2007 12:33:45 +0100
> Andre Haupt <andre@bitwigglers.org> wrote:
> 
> > I think, the status paramter should be unsigned. Is this correct?
> > This also fixes a sparse warning about different signedness.
> > Only compile tested, because i do not have the hardware.
> > 
> > From: Andre Haupt <andre@bitwigglers.org>
> > Signed-off-by: Andre Haupt <andre@bitwigglers.org>
> 
> Nicolas, does this seem correct to you? I'm not familiar with the 
> serial stuff.

Yes, that should be fine.

Acked-by: Nicolas Pitre <nico@cam.org>


Nicolas
