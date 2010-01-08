From: David Miller <davem@davemloft.net>
Date: Fri, 08 Jan 2010 08:13:02 +0000
Subject: Re: [PATCH 2/2] ide: add __init/__exit macros to
Message-Id: <20100108.001302.146106973.davem@davemloft.net>
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

> -	ide_pci_unregister_driver(&scc_pci_driver);
> +	pci_unregister_driver(&scc_pci_driver);

As a side note I can't figure out how this driver can currently even
build without errors before this patch.

ide_pci_unregister_driver() isn't even defined anywhere these days.
