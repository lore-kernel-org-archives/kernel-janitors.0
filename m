From: David Miller <davem@davemloft.net>
Date: Wed, 06 Jan 2010 20:28:26 +0000
Subject: Re: [PATCH 2/2] ide: add __init/__exit macros to
Message-Id: <20100106.122826.233087809.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1261470564-23754-2-git-send-email-peterhuewe@gmx.de>
	<alpine.LNX.2.00.1001051124150.2277@pobox.suse.cz>
	<201001051939.07756.bzolnier@gmail.com>
In-Reply-To: <201001051939.07756.bzolnier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bzolnier@gmail.com
Cc: jkosina@suse.cz, peterhuewe@gmx.de, kernel-janitors@vger.kernel.org, sshtylyov@ru.mvista.com, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org

From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Date: Tue, 5 Jan 2010 19:39:07 +0100

> We can fix it nowadays, though I worry that by fixing it we may be 'creating
> competition' for 'officially blessed yet unmaintained' PATA stack... 8-)

Not being able to unload a module is a bug isn't it?  Bug fixes
are always fine :-)

I'll take a closer look at this then apply it, thanks Bart!
