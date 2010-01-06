From: Peter Huewe <PeterHuewe@gmx.de>
Date: Wed, 06 Jan 2010 20:58:01 +0000
Subject: Re: [PATCH 2/2] ide: add __init/__exit macros to drivers/ide/scc_pata.c
Message-Id: <201001062158.01870.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1261470564-23754-2-git-send-email-peterhuewe@gmx.de> <201001051939.07756.bzolnier@gmail.com> <20100106.122826.233087809.davem@davemloft.net>
In-Reply-To: <20100106.122826.233087809.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: bzolnier@gmail.com, jkosina@suse.cz, kernel-janitors@vger.kernel.org, sshtylyov@ru.mvista.com, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org

Am Mittwoch 06 Januar 2010 21:28:26 schrieb David Miller:
> From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
> Date: Tue, 5 Jan 2010 19:39:07 +0100
> 
> 
> Not being able to unload a module is a bug isn't it?  Bug fixes
> are always fine :-)
> 
> I'll take a closer look at this then apply it, thanks Bart!

Funny what such trivial patch can reveal :)

Regards,
Peter
