From: Andi Kleen <andi@firstfloor.org>
Date: Thu, 10 Jan 2008 18:59:44 +0000
Subject: Re: [patch 1/1] Switch ioctl functions of drivers/scsi/sg.c to unlocked_ioctl
Message-Id: <20080110185944.GA1690@one.firstfloor.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080110180529.GA32640@skl-net.de> <1199991298.3141.75.camel@localhost.localdomain>
In-Reply-To: <1199991298.3141.75.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Andre Noll <maan@systemlinux.org>, linux-scsi <linux-scsi@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, Richard Knutsson <ricknu-0@student.ltu.se>

> Really, all this is doing is open coding what the ioctl handler is doing
> anyway, isn't it? in which case, why bother to change it at all?

Because once it's open coded it is visible and can then be eliminated.
Does SCSI need the BKL at all?

But perhaps for such a long ioctl handler it would be better to move
the lock/unlock_kernel()s into the individual case ...: statements;
then it could be eliminated step by step.

-Andi
