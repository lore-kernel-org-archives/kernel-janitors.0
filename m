From: Domen Puncer <domen@coderock.org>
Date: Tue, 21 Dec 2004 12:06:07 +0000
Subject: [KJ] Re: lcd: fix memory leak, code cleanup
Message-Id: <20041221120607.GA30293@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============048379893168758681=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041221015120.29110.98832.48706@localhost.localdomain>
In-Reply-To: <20041221015120.29110.98832.48706@localhost.localdomain>
To: James Nelson <james4765@verizon.net>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, akpm@osdl.org

--===============048379893168758681==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 20/12/04 19:50 -0600, James Nelson wrote:
> This patch addresses the following issues:
> 
> Fix log-spamming and cryptic error messages, and add KERN_ constants.
> Convert some ints to unsigned ints.
> Add checks for CAP_SYS_ADMIN for FLASH_Burn and FLASH_Erase ioctls.
> Identify use of global variable.
> Fix memory leak in FLASH_Burn ioctl.
> Fix error return codes in lcd_ioctl().
> Move variable "index" in lcd_ioctl() to smaller scope to reduce memory usage.
> Convert cli()/sti() to spin_lock_irqsave()/spin_unlock_irqrestore().
> Fix legibility issues in FLASH_Burn ioctl.
>


> -				cli();
> +				spin_lock_irqsave(&lcd_lock, flags);
>  				for (index = 0; index < (128); index++) {
>  
>  					WRITE_FLASH(kFlash_Addr1,
> @@ -480,32 +485,30 @@
>  						    kFlash_Data2);
>  					WRITE_FLASH(kFlash_Addr1,
>  						    kFlash_Prog);
> -					*((volatile unsigned char *)
> -					  burn_addr) =
> -		 (volatile unsigned char) rom[index];
> -
> -					while ((!dqpoll
> -						(burn_addr,
> -						 (volatile unsigned char)
> -						 rom[index]))
> -					       && (!timeout(burn_addr))) {
> -					}
> +					*((volatile unsigned char *)burn_addr) =
> +					  (volatile unsigned char) rom[index];
> +
> +					while ((!dqpoll (burn_addr,
> +						(volatile unsigned char)
> +						rom[index])) &&
> +						(!timeout(burn_addr))) { }
>  					burn_addr++;
>  				}
> -				restore_flags(flags);
> -				if (*
> -				    ((volatile unsigned char *) (burn_addr
> -								 - 1)) ==
> -				    (volatile unsigned char) rom[index -
> -								 1]) {
> +				spin_unlock_irqrestore(&lcd_lock, flags);


Although this will work, i think local_irq_{disable,enable} is the right
solution (we don't protect any data, just make sure timings are right).

For making it SMP safe, easiest/sane solution seems semaphore in
lcd_dev, which is down_interruptible(), at beginning of read, write
and ioctl.

Comments?


	Domen

--===============048379893168758681==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============048379893168758681==--
