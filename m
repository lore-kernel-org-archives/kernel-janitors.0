From: Francois Romieu <romieu@fr.zoreil.com>
Date: Mon, 08 Mar 2004 20:30:01 +0000
Subject: Re: [Kernel-janitors] [PATCH] - Audit for drivers/block/floppy.c.
Message-Id: <20040308213001.A1382@electric-eye.fr.zoreil.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1078342465.14557.44.camel@telecentrolivre>
In-Reply-To: <1078342465.14557.44.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br> :
[...]
> +out5:
> +	for (i = 0; i < N_DRIVE; i++)
> +		del_timer(&motor_off_timer[i]);
> +out4:
> +	flush_scheduled_work();
> +	if (usage_count)
> +		floppy_release_irq_and_dma();
> +out3:
>  	blk_unregister_region(MKDEV(FLOPPY_MAJOR, 0), 256);
>  	blk_cleanup_queue(floppy_queue);
> -fail_queue:
> +out2:
>  	unregister_blkdev(FLOPPY_MAJOR,"fd");
> -out:
> -	for (i=0; i<N_DRIVE; i++)
> -		put_disk(disks[i]);
> +out1:
>  	devfs_remove("floppy");
> +out:
> +	while (dr--)
> +		put_disk(disks[dr]);

What about renaming "out" to "out_put_disk", "out1" to "out_devfs_remove", etc.
so that it is possible to verify that the code behind a label actually does
what it is supposed to do ?

Numbered labels carry no information.

--
Ueimor
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
