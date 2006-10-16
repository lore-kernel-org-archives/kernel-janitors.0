From: Pierre Ossman <drzeus-list@drzeus.cx>
Date: Mon, 16 Oct 2006 06:49:02 +0000
Subject: Re: [KJ] [PATCH] drivers/mmc/mmc.c: Replacing yield() with a
Message-Id: <45332B5E.8010804@drzeus.cx>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1160570743.19143.307.camel@amol.verismonetworks.com> <1160571491.3000.372.camel@laptopd505.fenrus.org> <452DD88E.4030707@yahoo.com.au>
In-Reply-To: <452DD88E.4030707@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Piggin <nickpiggin@yahoo.com.au>
Cc: Arjan van de Ven <arjan@infradead.org>, Amol Lad <amol@verismonetworks.com>, linux kernel <linux-kernel@vger.kernel.org>, kernel Janitors <kernel-janitors@lists.osdl.org>

Nick Piggin wrote:
> 
> The condition looks broken too. It should be
> if (ms < 1000 / HZ) {...}
> 
> Shouldn't it?

Yup. I poked Russell about it ages ago, but he must have forgotten (and
admittedly, so have I). Since MMC is now on my table, I guess I should
put it on my todo list.

Rgds
-- 
     -- Pierre Ossman

  Linux kernel, MMC maintainer        http://www.kernel.org
  PulseAudio, core developer          http://pulseaudio.org
  rdesktop, core developer          http://www.rdesktop.org
  OLPC, developer                     http://www.laptop.org
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
