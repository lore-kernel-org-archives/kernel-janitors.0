From: Matthew Wilcox <willy@debian.org>
Date: Sat, 03 Jan 2004 22:40:17 +0000
Subject: Re: [Kernel-janitors] [PATCH] Check return code in
Message-Id: <20040103224017.GR6982@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132524.GA21909@eugeneteo.net>
In-Reply-To: <20040103132524.GA21909@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jan 03, 2004 at 09:26:13PM +0800, Eugene Teo wrote:
> http://www.anomalistic.org/patches/setup-check-ret-alloc_bootmem_low-fix-2.6.1-rc1-mm1.patch
> 
> diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/arch/i386/kernel/setup.c 2.6.1-rc1-mm1-fix/arch/i386/kernel/setup.c
> --- 2.6.1-rc1-mm1/arch/i386/kernel/setup.c	2004-01-03 20:33:38.000000000 +0800
> +++ 2.6.1-rc1-mm1-fix/arch/i386/kernel/setup.c	2004-01-03 20:58:40.000000000 +0800
> @@ -875,6 +877,10 @@
>  		if (e820.map[i].addr + e820.map[i].size > 0x100000000ULL)
>  			continue;
>  		res = alloc_bootmem_low(sizeof(struct resource));
> +		if (!res) {
> +			printk(KERN_ERR "Cannot allocate lowmem\n");
> +			return;
> +		}
>  		switch (e820.map[i].type) {
>  		case E820_RAM:	res->name = "System RAM"; break;
>  		case E820_ACPI:	res->name = "ACPI Tables"; break;

I'd rather panic() at this point, otherwise we're going to start
allocating areas twice and have some really unexplainable crashes.
say something like ... panic("Insufficient memory to boot\n");

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
