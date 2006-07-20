From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 20 Jul 2006 10:26:42 +0000
Subject: Re: [KJ] [PATCH][NET] ULi526x - driver cleanups
Message-Id: <20060720102642.GI9499@rotomalug.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44BF56B8.9050502@nachtwindheim.de>
In-Reply-To: <44BF56B8.9050502@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Henne (henne@nachtwindheim.de) wrote:
> From: Henrik Kretzschmar <henne@nachtwindheim.de>
> 
> Some little cleanups for ULI-TULIP-driver:
> 
> pci_module_init() conversion to pci_register_driver()
> remove rc, an unneeded variable from uli526x_module_init()
> let the debug macros use correct loglevels
> add a loglevel to a printk
> let some code more look like CodingStyle
> 
> Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>

Split it in different patch for different goal.

Have a nice day,

			 - Christophe -

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
