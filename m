From: Pierre Ossman <drzeus-list@drzeus.cx>
Date: Sun, 22 Oct 2006 20:23:59 +0000
Subject: Re: [KJ] [PATCH] drivers/mmc/mmc.c: Replacing yield() with a
Message-Id: <453BD35F.1030902@drzeus.cx>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1160570743.19143.307.camel@amol.verismonetworks.com>
In-Reply-To: <1160570743.19143.307.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amol Lad <amol@verismonetworks.com>
Cc: linux kernel <linux-kernel@vger.kernel.org>, kernel Janitors <kernel-janitors@lists.osdl.org>

Amol Lad wrote:
> In 2.6, the semantics of calling yield() changed from "sleep for a
> bit" to "I really don't want to run for a while".  This matches POSIX
> better, but there's a lot of drivers still using yield() when they mean
> cond_resched(), schedule() or even schedule_timeout().
> 
> For this driver cond_resched() seems to be a better
> alternative
> 

A version of this patch has been pushed towards Andrew. Thanks for
pointing it out.

Rgds
-- 
     -- Pierre Ossman

  Linux kernel, MMC maintainer        http://www.kernel.org
  PulseAudio, core developer          http://pulseaudio.org
  rdesktop, core developer          http://www.rdesktop.org
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
