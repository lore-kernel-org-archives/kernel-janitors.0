From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Tue, 06 Mar 2007 15:49:32 +0000
Subject: Re: [KJ] [kj]patch7:replace pci_find_device in sound/oss/trident.c
Message-Id: <20070306164149.36e3b855@lxorguk.ukuu.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1173175287.32705.5.camel@bluegenie>
In-Reply-To: <1173175287.32705.5.camel@bluegenie>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Surya <surya.prabhakar@wipro.com>
Cc: mulix@mulix.org, linux-kernel@vger.kernel.org, kernel-janitors <kernel-janitors@lists.osdl.org>

On Tue, 06 Mar 2007 15:31:27 +0530
Surya <surya.prabhakar@wipro.com> wrote:

> Hi,
>  Cleanup of pci_find_device to pci_get_device in sound/oss/trident.c
> Applies and compiles clean to latest Linus tree. Not tested!


Thanks. 

I would move the pci_dev_put inside the if as well (the variable is only
used in the ALi section so could itself also be moved), but the fix
appears correct.

Alan
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
