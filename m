From: Andi Kleen <andi@firstfloor.org>
Date: Thu, 10 Jan 2008 19:38:39 +0000
Subject: Re: [patch 1/1] Switch ioctl functions of drivers/scsi/sg.c to unlocked_ioctl
Message-Id: <20080110193839.GA2120@one.firstfloor.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080110180529.GA32640@skl-net.de> <1199991298.3141.75.camel@localhost.localdomain> <20080110185944.GA1690@one.firstfloor.org> <1199991828.3141.82.camel@localhost.localdomain> <20080110193227.GH747@one.firstfloor.org> <20080110193321.GH18741@parisc-linux.org>
In-Reply-To: <20080110193321.GH18741@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: Andi Kleen <andi@firstfloor.org>, James Bottomley <James.Bottomley@HansenPartnership.com>, Andre Noll <maan@systemlinux.org>, linux-scsi <linux-scsi@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Richard Knutsson <ricknu-0@student.ltu.se>

> If your goal is to get rid of the BKL everywhere, sure.  It's not clear
> to me this is the most productive way of spending our time though.

I believe eventually eliminating ->ioctl (as opposed to ->unlocked_ioctl)
would be a productive thing to do. Still having implicit BKL semantics in 
such an important interface is just wrong.

-Andi
