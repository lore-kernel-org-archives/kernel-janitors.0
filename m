From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Thu, 20 Jan 2005 19:36:40 +0000
Subject: Re: [KJ] 	Status of checking for NULL, convert drivers to new PCI
Message-Id: <41F00848.2050902@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Stephen torri wrote:
> What is the status of these projects?
> 
> - get rid of save_flags_cli, use local_irq_save instead

There are lots of these that still need work, but we are
not looking for a mechanical find&replace substitution
of these deprecated functions.  See
linux/Documentation/cli-sti-removal.txt for details.
In lots of cases, it will mean adding spinlocks and
understanding the driver enough to know what data must
be protected... non-trivial...

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
