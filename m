From: Alan Stern <stern@rowland.harvard.edu>
Date: Wed, 28 Jul 2004 16:05:30 +0000
Subject: [Kernel-janitors] Re: [PATCH] usb/uhci-hcd: replace
Message-Id: <Pine.LNX.4.44L0.0407281204520.1994-100000@ida.rowland.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58745849930287863=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============58745849930287863==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 27 Jul 2004, Nishanth Aravamudan wrote:

> I would appreciate any comments from the janitors list. 
> 
> Applys-to: 2.6.7
> 
> Description: Use msleep() instead of schedule_timeout() to 
> guarantee the task delays for the desired time.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> 
> --- linux-vanilla/drivers/usb/host/uhci-hcd.c	2004-06-16 05:19:53.000000000 +0000
> +++ linux-dev/drivers/usb/host/uhci-hcd.c	2004-07-06 01:04:33.000000000 +0000
> @@ -1834,13 +1834,11 @@ static void reset_hc(struct uhci_hcd *uh
>  	/* Global reset for 50ms */
>  	uhci->state = UHCI_RESET;
>  	outw(USBCMD_GRESET, io_addr + USBCMD);
> -	set_current_state(TASK_UNINTERRUPTIBLE);
> -	schedule_timeout((HZ*50+999) / 1000);
> +	msleep(50);
>  	outw(0, io_addr + USBCMD);
>  
>  	/* Another 10ms delay */
> -	set_current_state(TASK_UNINTERRUPTIBLE);
> -	schedule_timeout((HZ*10+999) / 1000);
> +	msleep(10);
>  	uhci->resume_detect = 0;
>  }
>  

This change has already been made.

Alan Stern


--===============58745849930287863==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58745849930287863==--
