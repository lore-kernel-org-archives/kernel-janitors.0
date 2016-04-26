From: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 26 Apr 2016 06:20:31 +0000
Subject: Re: [PATCH 2/4] mtd: maps: add __init attribute
Message-Id: <20160426062031.GD25981@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1461069215-22795-1-git-send-email-Julia.Lawall@lip6.fr>
 <1461069215-22795-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1461069215-22795-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: David Woodhouse <dwmw2@infradead.org>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, "Luis R . Rodriguez" <mcgrof@kernel.org>, Josh Triplett <josh@joshtriplett.org>

On Tue, Apr 19, 2016 at 02:33:33PM +0200, Julia Lawall wrote:
> Add __init attribute on functions that are only called from other __init
> functions and that are not inlined, at least with gcc version 4.8.4 on an
> x86 machine with allyesconfig.  Currently, the functions are put in the
> .text.unlikely segment.  Declaring them as __init will cause them to be
> put in the .init.text and to disappear after initialization.
> 
> The result of objdump -x on the functions before the change is as follows:
> 
> 00000000000001bc l     F .text.unlikely 00000000000006a2 ck804xrom_init_one.isra.1
> 00000000000001aa l     F .text.unlikely 0000000000000764 esb2rom_init_one.isra.1
> 00000000000001db l     F .text.unlikely 0000000000000716 ichxrom_init_one.isra.1
> 
> And after the change it is as follows:
> 
> 0000000000000000 l     F .init.text	000000000000069d ck804xrom_init_one.isra.1
> 0000000000000000 l     F .init.text	000000000000075f esb2rom_init_one.isra.1
> 0000000000000000 l     F .init.text	0000000000000711 ichxrom_init_one.isra.1
> 
> Done with the help of Coccinelle.  The semantic patch checks for local
> static non-init functions that are called from an __init function and are
> not called from any other function.
> 
> Note that in each case, the function is stored in the probe field of a
> pci_driver structure, but this code is under an #if 0.  The #if 0s have
> been unchanged since 2009 at the latest.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied patches 2 and 3 to l2-mtd.git
