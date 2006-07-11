From: Kyle McMartin <kyle@parisc-linux.org>
Date: Tue, 11 Jul 2006 15:32:00 +0000
Subject: Re: [KJ] [PATCH] drivers/parisc/superio.c: check return values of
Message-Id: <20060711153200.GB27106@athena.road.mcmartin.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060711020442.GA17650@chello.nl>
In-Reply-To: <20060711020442.GA17650@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jul 11, 2006 at 04:04:42AM +0200, Richard wrote:
> Check return values of request region and act accordingly
> 
> -	request_region (IC_PIC1, 0x1f, "pic1");
> -	request_region (IC_PIC2, 0x1f, "pic2");
> -	request_region (sio->acpi_base, 0x1f, "acpi");

This function only runs if it's in a parisc machine with a superio
device. It's virtually impossible for this to fail. I've made it
just BUG_ON(!request_region(...)); instead of bothering with any
kind of error handling.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
