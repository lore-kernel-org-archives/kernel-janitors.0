From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 23:46:47 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 2/3] ide/ide-cs: replace
Message-Id: <20040916234647.GI1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86746572926123378=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============86746572926123378==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Sorry, bad description, it

Uses msleep() in place of schedule_timeout() to guarantee the task
delays as expected.

On Thu, Sep 16, 2004 at 04:44:48PM -0700, Nishanth Aravamudan wrote:
> Any comments would be appreciated.
> 
> Description: Uses msleep() in place of cdrom_sleep()
> to guarantee the task delays as expected.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> --- 2.6.9-rc2-vanilla/drivers/ide/legacy/ide-cs.c	2004-09-13 17:16:06.000000000 -0700
> +++ 2.6.9-rc2/drivers/ide/legacy/ide-cs.c	2004-09-16 16:42:03.000000000 -0700
> @@ -43,6 +43,7 @@
>  #include <linux/ide.h>
>  #include <linux/hdreg.h>
>  #include <linux/major.h>
> +#include <linux/delay.h>
>  #include <asm/io.h>
>  #include <asm/system.h>
>  
> @@ -357,8 +358,7 @@ void ide_config(dev_link_t *link)
>  		break;
>  	    }
>  	}
> -	__set_current_state(TASK_UNINTERRUPTIBLE);
> -	schedule_timeout(HZ/10);
> +	msleep(100);
>      }
>  
>      if (hd < 0) {

--===============86746572926123378==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86746572926123378==--
