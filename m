From: Alan Stern <stern@rowland.harvard.edu>
Date: Tue, 28 Sep 2004 15:24:53 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 4/9] usb/file_storage:
Message-Id: <Pine.LNX.4.44L0.0409281121480.1344-100000@ida.rowland.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20249783150662948=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040920215026.GK2270@us.ibm.com>
In-Reply-To: <20040920215026.GK2270@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============20249783150662948==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 27 Sep 2004, Nishanth Aravamudan wrote:

> Any comments would be appreciated.
> 
> Description: Use msleep_interruptible() instead of schedule_timeout()
> so that the task delays as expected.
> 
> --- 2.6.9-rc2-vanilla/drivers/usb/gadget/file_storage.c	2004-09-13 17:15:52.000000000 -0700
> +++ 2.6.9-rc2/drivers/usb/gadget/file_storage.c	2004-09-27 14:47:54.000000000 -0700
> @@ -217,6 +217,7 @@
>  #include <linux/compiler.h>
>  #include <linux/completion.h>
>  #include <linux/dcache.h>
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/fcntl.h>
>  #include <linux/file.h>
> @@ -2280,8 +2281,7 @@ static int halt_bulk_in_endpoint(struct 
>  		}
>  
>  		/* Wait for a short time and then try again */
> -		set_current_state(TASK_INTERRUPTIBLE);
> -		if (schedule_timeout(HZ / 10) != 0)
> +		if (msleep_interruptible(100) != 0)
>  			return -EINTR;
>  		rc = usb_ep_set_halt(fsg->bulk_in);
>  	}

This change is okay.  Greg, you have my approval to apply it.

Alan Stern


--===============20249783150662948==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20249783150662948==--
