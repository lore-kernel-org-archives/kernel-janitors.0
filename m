From: Kristen Carlson <kristenc@cs.pdx.edu>
Date: Wed, 16 Jun 2004 16:48:26 +0000
Subject: Re: [Kernel-janitors] please comment on this patch
Message-Id: <200406161648.i5GGmQPJ001456@sirius.cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9226355655663584=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200406160257.i5G2vWLJ023048@sirius.cs.pdx.edu>
In-Reply-To: <200406160257.i5G2vWLJ023048@sirius.cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============9226355655663584==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

> On Tue, Jun 15, 2004 at 07:57:32PM -0700, Kristen Carlson wrote:
> > For removing check_region from drivers/char/esp.c
> 
> Better than most first attempts, but some problems.  Mostly inherent in the
> original driver ;-)


Agreed, the driver is not written in the clearest way it could have been .  
This actually brings me to ask a philosophical clarification for janitor work.
In general, should we stick with our appointed task (i.e. do as little as 
possible to the driver except what the instructions in the TODO list specify), 
or is it acceptable to do more extensive changes?  AND, without hardware to 
test with, how much changes should you really do to a driver?  For example, 
I don't know if I'd feel comfortable re-writing too much of this driver 
without being able to test it.

> 
> Now we have autoconfig() itself.  We don't need interrupts disabled while
> calling request_region() [indeed, this is actually a bug -- request_region()
> calls kmalloc(GFP_KERNEL)].  So autoconfig() should look more like:
> 
> static _INLINE_ int autoconfig(struct esp_struct * info, int *region_start)
> {
>         int port_detected = 0;
>         unsigned long flags;
> 
> 	if (!request_region(*region_start, info->port - *region_start + 8,
> 			"esp serial"))
> 		return -EIO;
> 
> 	save_flags(flags); cli();


Ok, I will fix this also.

> ...
> 
> Personally, I dislike the port_detected flag.  I would do that part as:
> 
> 	if (serial_in(info, UART_ESI_BASE) == 0xf3) {
> 		serial_out(info, UART_ESI_CMD1, 0x00);
> 		serial_out(info, UART_ESI_CMD1, 0x01);
> 		if ((serial_in(info, UART_ESI_STAT2) & 0x70) != 0x20)
> 			goto not_present;
> ...
> 	}
> 
> 	restore_flags(flags);
> 	return 1;
> 
>  not_present:
> 	release_region(*region_start, info->port - *region_start + 8);
> 	restore_flags(flags);
> 	return 0;
> }
> 
> The big thing that concerns me about the original driver is:
> 
>                         if (ports && (ports->port == (info->port - 8))) {
>                                 release_region(*region_start,
>                                                info->port - *region_start);
>                         } else
>                                 *region_start = info->port;
> 
> This seems to be an attempt to combine all the contiguous port ranges
> into one.  Your patch breaks this as we'll always end up with the region
> being released when we fail to discover the last consecutive port.
> But the original code was so obfuscated, I can't really blame you for
> missing this one.


Whooops. :). 

> 
> I think it's probably better to ignore this previous "feature" of the driver.
> No other driver (that I know of) does this, and we can simplify the driver
> as follows:
> 
> 	if (!request_region(*region_start, info->port - *region_start + 8,
> 			 "esp serial"))
> becomes
> 	if (!request_region(info->port, 8, "esp serial"))
> 
> We can lose the region_start variable entirely (every use of it becomes
> obsolete across the entire driver).  espserial_exit() needs to be changed
> to go along with this new scheme.


Ok, I will take this approach and resubmit another patch to see if it
works better.


> 
> Somebody really needs to step up and maintain this driver (preferably
> someone with hardware).  It won't work on SMP with 2.6 and it needs to
> be converted to use the new serial core (drivers/serial/)
> 
> Hope that was useful.



Yes, thanks so much for spending time on this :).
Kristen



-- 
WWXD (What Would Xena Do?) 


--===============9226355655663584==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9226355655663584==--
