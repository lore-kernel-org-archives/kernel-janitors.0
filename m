From: Jim Nelson <james4765@cwazy.co.uk>
Date: Sun, 16 Jan 2005 20:13:29 +0000
Subject: [KJ] Re: [PATCH 0/13] remove cli()/sti() in drivers/char/*
Message-Id: <41EACAE9.9090505@cwazy.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73528966867531098=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050116135223.30109.26479.55757@localhost.localdomain> <41EABFC5.3060002@osdl.org>
In-Reply-To: <41EABFC5.3060002@osdl.org>
To: "Randy.Dunlap" <rddunlap@osdl.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, akpm@osdl.org

--===============73528966867531098==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Randy.Dunlap wrote:
> James Nelson wrote:
> 
>> This series of patches removes the last 
>> cli()/sti()/save_flags()/restore_flags()
>> function calls in drivers/char.
> 
> 
> to what end?
> 
> I guess I don't get it.  What makes these drivers SMP-safe now?
> 
> Or is this series of patches only done to kill off the use
> of deprecated functions?  If that's the case, they could
> easily give someone the (false) expectation that the drivers
> are SMP-safe, couldn't they?  Well, ftape (for one) is still
> marked as BROKEN_ON_SMP, but will people know why it's
> marked that way?
> 
> Have you read Documentation/cli-sti-removal.txt ?
> 
I have.  This is just to get rid of the deprecated functions - most of this stuff 
is already marked BROKEN_ON_SMP (stallion, serial_tx3912, epca, esp, istallion, 
riscom8, ftape, pcxx and moxa), and ite_gpio.c is a driver for a UP system board.

Maybe later (when I have more of an understanding of serial_core, and major driver 
overhaul) I can tackle actually fixing them, but right now, I'm just doing cleanup 
work.

Jim

--===============73528966867531098==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73528966867531098==--
