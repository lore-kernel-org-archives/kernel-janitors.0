From: maximilian attems <janitor@sternwelten.at>
Date: Tue, 21 Sep 2004 20:53:55 +0000
Subject: Re: [Kernel-janitors] [PATCH 2.6.9-rc2 32/33] char/zftape-buffers:
Message-Id: <20040921205355.GC4260@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96244010816783865=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916221203.GZ1777@us.ibm.com>
In-Reply-To: <20040916221203.GZ1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============96244010816783865==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, 16 Sep 2004, Nishanth Aravamudan wrote:

> Any comments would be appreciated. There actually won't be a PATCH
> 33/33, because I dropped one that even I wouldn't approve :)
> 
> Description: Use msleep_interruptible() instead of schedule_timeout() to
> guarantee the task delays as expected.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> --- 2.6.9-rc2-vanilla/drivers/char/ftape/zftape/zftape-buffers.c	2004-09-13 17:15:47.000000000 -0700
> +++ 2.6.9-rc2/drivers/char/ftape/zftape/zftape-buffers.c	2004-09-16 15:04:45.000000000 -0700
> @@ -27,6 +27,7 @@
>  #include <linux/errno.h>
>  #include <linux/mm.h>
>  #include <linux/slab.h>
> +#include <linux/delay.h>
>  
>  #include <linux/zftape.h>
>  
> @@ -119,8 +120,7 @@ void *zft_kmalloc(size_t size)
>  	void *new;
>  
>  	while ((new = kmalloc(size, GFP_KERNEL)) == NULL) {
> -		current->state   = TASK_INTERRUPTIBLE;
> -		schedule_timeout(HZ/10);
> +		msleep_interuptible(100);
			   ^
hmm strange function you are referencing ;)
grep says it's the only case of this typo.
fixed in kjt.
>  	}
>  	memset(new, 0, size);
>  	used_memory += size;

a++ maks


--===============96244010816783865==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96244010816783865==--
