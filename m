From: walter harms <wharms@bfs.de>
Date: Tue, 21 Dec 2004 08:15:50 +0000
Subject: Re: [KJ] [PATCH] lcd: fix memory leak, code cleanup
Message-Id: <41C7DBB6.8070105@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83917176470933152=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041221015120.29110.98832.48706@localhost.localdomain>
In-Reply-To: <20041221015120.29110.98832.48706@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============83917176470933152==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


Hi James,
misc_register() can fail.

ret=misc_register(&lcd_dev);

if (ret < 0) {
	pr_info("misc_register failed in %s\n",__FUNCTION__);
	return -ENOMEM;
	}

re,
walter



>  	}
>  
> @@ -613,7 +615,7 @@
>  {
>  	unsigned long data;
>  
> -	printk("%s\n", LCD_DRIVER);
> +	pr_info("%s\n", LCD_DRIVER);
>  	misc_register(&lcd_dev);
>  
>  	/* Check region? Naaah! Just snarf it up. */
> @@ -623,7 +625,7 @@
>  	data = LCDReadData;
>  	if ((data & 0x000000FF) == (0x00)) {
>  		lcd_present = 0;
> -		printk("LCD Not Present\n");
> +		pr_info(LCD "LCD Not Present\n");
>  	} else {
>  		lcd_present = 1;
>  		WRITE_GAL(kGal_DevBank2PReg, kGal_DevBank2Cfg);

--===============83917176470933152==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83917176470933152==--
