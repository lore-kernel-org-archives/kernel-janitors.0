From: Amol Lad <amol@verismonetworks.com>
Date: Tue, 03 Oct 2006 04:27:28 +0000
Subject: Re: [KJ] [PATCH][RESEND] misc_register : arch/x86_64/kernel/mce.c
Message-Id: <1159848928.19143.7.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061002121616.GA8331@rotomalug.org>
In-Reply-To: <20061002121616.GA8331@rotomalug.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> -	misc_register(&mce_log_device);
> +	err = misc_register(&mce_log_device);
> +	if (err < 0)
> +		printk(KERN_ERR "Failed to register mce.\n");
>  	return err;

Failure of misc_register not necessarily means that the calling function
should return an error. There are two possible cases:
1. Programmer deliberately left of misc_register return check as he
thought the error is not critical. Here you may want to just print a
warning message. (like arch/i386/kernel/apm.c)
2. Bug. This is where you need to return error.

Now the challenge is to differentiate between 1 & 2.

Good luck

>  }
>  
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
> 

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
