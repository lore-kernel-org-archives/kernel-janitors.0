From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Tue, 18 Jan 2005 10:38:56 +0000
Subject: Re: [KJ] [PATCH] printk function
Message-Id: <200501181333.45497.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============077458730415172816=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1106001987.20867.6.camel@localhost.localdomain>
In-Reply-To: <1106001987.20867.6.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============077458730415172816==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Tuesday 18 January 2005 02:26, Rafael Pereira wrote:

> The patch for the printk function.

> --- linux-2.6.11-rc1/arch/alpha/kernel/core_wildfire.c
> +++ linux/arch/alpha/kernel/core_wildfire.c

> -	printk(" hard_qbb_map: ");
> +	printk(KERN_ERR " hard_qbb_map: ");

Notice this printk doesn't have trailing "\n".

>  	for (i = 0; i < WILDFIRE_MAX_QBB; i++)
>  	    if (wildfire_hard_qbb_map[i] == QBB_MAP_EMPTY)
> -		printk("--- ");
> +		printk(KERN_ERR "--- ");

Adding KERN_* in such loops screwes the output.

>  	    else
> -		printk("%3d ", wildfire_hard_qbb_map[i]);
> -	printk("\n");
> +		printk(KERN_ERR "%3d ", wildfire_hard_qbb_map[i]);
> +	printk(KERN_ERR "\n");

Not every printk instance should use KERN_*. Domen, I think this should be
added to TODO.

> -	printk(" soft_qbb_map: ");
> +	printk(KERN_ERR " soft_qbb_map: ");
>  	for (i = 0; i < WILDFIRE_MAX_QBB; i++)
>  	    if (wildfire_soft_qbb_map[i] == QBB_MAP_EMPTY)
> -		printk("--- ");
> +		printk(KERN_ERR "--- ");
		       ^^^^^^^^
>  	    else
> -		printk("%3d ", wildfire_soft_qbb_map[i]);
> -	printk("\n");
> +		printk(KERN_ERR "%3d ", wildfire_soft_qbb_map[i]);
		       ^^^^^^^^
> +	printk(KERN_ERR "\n");
	       ^^^^^^^^

Same error.

> --- linux-2.6.11-rc1/arch/ppc64/kernel/prom.c
> +++ linux/arch/ppc64/kernel/prom.c

>  			printk(KERN_DEBUG "hmmm, got %d intr cells for %s:", n,
>  			       node->full_name);
>  			for (j = 0; j < n; ++j)
> -				printk(" %d", irq[j]);
> -			printk("\n");
> +				printk(KERN_DEBUG " %d", irq[j]);
				       ^^^^^^^^^^
> +			printk(KERN_DEBUG "\n");
			       ^^^^^^^^^^

> --- linux-2.6.11-rc1/arch/sparc64/kernel/smp.c
> +++ linux/arch/sparc64/kernel/smp.c

>  #ifdef CAPTURE_DEBUG
> -		printk("CPU[%d]: Sending penguins to jail...",
> +		printk(KERN_DEBUG "CPU[%d]: Sending penguins to jail...",
>  		       smp_processor_id());
>  #endif

>  #ifdef CAPTURE_DEBUG
> -		printk("done\n");
> +		printk(KERN_DEBUG "done\n");
		       ^^^^^^^^^^

> --- linux-2.6.11-rc1/arch/um/kernel/irq_user.c
> +++ linux/arch/um/kernel/irq_user.c

> -		printk("free_irq_later found no irq, irq = %d, "
> +		printk(fKERN_ERR "free_irq_later found no irq, irq = %d, "

Oops, a typo.

> --- linux-2.6.11-rc1/arch/um/kernel/sigio_user.c
> +++ linux/arch/um/kernel/sigio_user.c

> -	printk("Checking that host ptys support output SIGIO...");
> +	printk(KERN_WARNING "Checking that host ptys support output SIGIO...");

>  	if(got_sigio){
> -		printk("Yes\n");
> +		printk(KERN_ERR "Yes\n");
		       ^^^^^^^^
>  		pty_output_sigio = 1;
>  	}
> -	else if(n == -EAGAIN) printk("No, enabling workaround\n");
> +	else if(n == -EAGAIN) printk(KERN_ERR "No, enabling workaround\n");
				     ^^^^^^^^

>  static void tty_close(int master, int slave)
>  {
> -	printk("Checking that host ptys support SIGIO on close...");
> +	printk(KERN_INFO "Checking that host ptys support SIGIO on close...");
>  
>  	os_close_file(slave);
>  	if(got_sigio){
> -		printk("Yes\n");
> +		printk(KERN_INFO "Yes\n");
		       ^^^^^^^^^
>  		pty_close_sigio = 1;
>  	}
> -	else printk("No, enabling workaround\n");
> +	else printk(KERN_WARNING "No, enabling workaround\n");
		    ^^^^^^^^^^^^
 
> --- linux-2.6.11-rc1/drivers/block/acsi.c
> +++ linux/drivers/block/acsi.c
> @@ -1668,22 +1668,22 @@
>  				printk( KERN_INFO "Detected ");
>  				switch (aip->type) {
>  				  case HARDDISK:
> -					printk("disk");
> +					printk(KERN_INFO "disk");
					       ^^^^^^^^^
>  					break;
>  				  case CDROM:
> -					printk("cdrom");
> +					printk(KERN_INFO "cdrom");
					       ^^^^^^^^^
>  					break;
>  				  default:
>  				}
> -				printk(" ad%c at id %d lun %d ",
> +				printk(KERN_INFO " ad%c at id %d lun %d ",
>  				       'a' + NDevices, target, lun);
>  				if (aip->removable) 
> -					printk("(removable) ");
> +					printk(KERN_INFO "(removable) ");
					       ^^^^^^^^^
>  				if (aip->read_only) 
> -					printk("(read-only) ");
> +					printk(KERN_INFO "(read-only) ");
					       ^^^^^^^^^
>  				if (aip->size == DEFAULT_SIZE)
> -					printk(" unkown size, using default ");
> -				printk("%ld MByte\n",
> +					printk(KERN_INFO " unkown size, using default ");
					       ^^^^^^^^^
> +				printk(KERN_INFO "%ld MByte\n",
				       ^^^^^^^^^

> --- linux-2.6.11-rc1/kernel/module.c
> +++ linux/kernel/module.c
> @@ -2060,10 +2060,10 @@
>  {
>  	struct module *mod;
>  
> -	printk("Modules linked in:");
> +	printk(KERN_INFO "Modules linked in:");
>  	list_for_each_entry(mod, &modules, list)
> -		printk(" %s", mod->name);
> -	printk("\n");
> +		printk(KERN_INFO " %s", mod->name);
		       ^^^^^^^^^
> +	printk(KERN_INFO "\n");
	       ^^^^^^^^^

> --- linux-2.6.11-rc1/kernel/power/disk.c
> +++ linux/kernel/power/disk.c

> -	printk("Freeing memory...  ");
> +	printk(KERN_INFO "Freeing memory...  ");
>  	while ((tmp = shrink_all_memory(10000))) {
>  		pages += tmp;
> -		printk("\b%c", p[i]);
> +		printk(KERN_INFO "\b%c", p[i]);
		       ^^^^^^^^^
> -	printk("\bdone (%li pages freed)\n", pages);
> +	printk(KERN_INFO "\bdone (%li pages freed)\n", pages);
	       ^^^^^^^^^

Many more left. Double check that you aren't adding KERN_* in the _middle_ of
a log message, ok? Also minimal splitting would be nice (arch/alpha/* part,
kernel/* part, ...).

	Alexey


--===============077458730415172816==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============077458730415172816==--
