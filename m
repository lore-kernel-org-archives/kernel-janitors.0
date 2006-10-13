From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Fri, 13 Oct 2006 15:00:57 +0000
Subject: Re: [KJ] [PATCH] drivers/char/riscom8.c:
Message-Id: <1160751657.25218.47.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1160739628.19143.376.camel@amol.verismonetworks.com>
In-Reply-To: <1160739628.19143.376.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amol Lad <amol@verismonetworks.com>
Cc: linux kernel <linux-kernel@vger.kernel.org>, kernel Janitors <kernel-janitors@lists.osdl.org>

Ar Gwe, 2006-10-13 am 17:10 +0530, ysgrifennodd Amol Lad:
> Removed save_flags()/cli()/sti() and used (light weight) spin locks
> 

Have you tested this and verified there are no recursive locking cases
in your changes ?

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
