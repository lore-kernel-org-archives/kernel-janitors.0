From: maximilian attems <janitor@sternwelten.at>
Date: Tue, 21 Sep 2004 19:12:59 +0000
Subject: Re: [Kernel-janitors] [PATCH 2.6.9-rc2 3/3] ide/ide-tape: replace
Message-Id: <20040921191259.GA2384@v216-190.vps.tuwien.ac.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96001184947456752=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916234735.GJ1777@us.ibm.com>
In-Reply-To: <20040916234735.GJ1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============96001184947456752==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, 16 Sep 2004, Nishanth Aravamudan wrote:

> Any comments would be appreciated.
> 
> Description: Uses msleep_interruptible() in place of schedule_timeout()
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

hmm this patch is same as the one before resend, it uses msleep().
did you forget to update, or is it just a comment mismatch?
until feedback i keep old one for kjt. :)

a++ maks


--===============96001184947456752==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96001184947456752==--
