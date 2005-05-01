From: Christophe Lucas <clucas@rotomalug.org>
Date: Sun, 01 May 2005 18:55:46 +0000
Subject: Re: [KJ] sti()/cli()-removal, ep7211.c
Message-Id: <20050501185546.GA5748@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52384051757276884=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52384051757276884==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

david.chosrova@libertysurf.fr (david.chosrova@libertysurf.fr) wrote:
> Thank you for the comments ( Domen, francois, Randy).
> 
> 
>  --- linux-2.6.11.7/drivers/net/irda/ep7211_ir.c.orig
> 2005-04-27 17:41:36.000000000 +0100
> +++ linux-2.6.11.7/drivers/net/irda/ep7211_ir.c	2005-04-30
> 13:44:03.000000000 +0100
> @@ -8,12 +8,14 @@
>  #include <linux/delay.h>
>  #include <linux/tty.h>
>  #include <linux/init.h>
> +#include <linux/spinlock.h>
> 
>  #include <net/irda/irda.h>
>  #include <net/irda/irda_device.h>
> 
> [SNIP]
>  }

One comment from Domen: no one Signed-Off-By ;) such as :
Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

It must be included.


Ps: Il faut ajouter un signed-Off-By ;)
-- 
	~Christophe


--===============52384051757276884==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52384051757276884==--
