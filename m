From: Jiri Kosina <jkosina@suse.cz>
Date: Mon, 24 Aug 2009 08:18:50 +0000
Subject: Re: [PATCH] gpio: adding __init/__exit macros in
Message-Id: <alpine.LNX.2.00.0908241018380.25797@wotan.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200908230201.10471.PeterHuewe@gmx.de> <200908230206.57937.mb@bu3sch.de>
In-Reply-To: <200908230206.57937.mb@bu3sch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Buesch <mb@bu3sch.de>
Cc: Peter Huewe <PeterHuewe@gmx.de>, Kay Sievers <kay.sievers@vrfy.org>, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 23 Aug 2009, Michael Buesch wrote:

> > Trivial patch which adds the __init/__exit macro to the init/exit functions of
> > drivers/gpio/bt8xxgpio.c
> > 
> > Michael, Kay or Greg, please have a look at the small patch and either pull it
> > through your tree, or please ack' it so Jiri can pull it through the trivial
> > tree.
> > 
> > linux version 2.6.31-rc7 - linus git tree, So 23. Aug 01:38:43 CEST 2009
> > 
> > Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> 
> Acked-by: Michael Buesch <mb@bu3sch.de>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs
