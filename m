From: Greg KH <greg@kroah.com>
Date: Fri, 04 Mar 2005 16:58:57 +0000
Subject: Re: [KJ] linux-2.6.9: psmouse fix names
Message-Id: <20050304165857.GG28179@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43717981007234585=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42282D69.90404@bfs.de>
In-Reply-To: <42282D69.90404@bfs.de>
To: kernel-janitors@vger.kernel.org

--===============43717981007234585==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 04, 2005 at 10:42:01AM +0100, walter harms wrote:
> Hi list,
> 
> the psmouse driver reports the name "psmouse.c" with error messages. 
> Since there is a psmouse.o but no .c this is confusing. (at least to 
> me). this patch changes the hardcoded names to __FUNCTION__.
> 
> btw: do anyone know how to restart the synaptics driver ? it stops 
> working sometimes.
> 
> (because of tab/space problems this patch is also attached).
> 
> drivers/input/mouse/psmouse-base.c
> 
> replace wrong filenames in error messages
> 
> Signed-off-by: walter harms <wharms@bfs.de>
> 
> --- linux-2.6.9/drivers/input/mouse/psmouse-base.c.bak	2005-03-03 
> 22:18:49.000000000 +0100
> +++ linux-2.6.9/drivers/input/mouse/psmouse-base.c	2005-03-03 
> 22:38:57.000000000 +0100
> @@ -141,7 +141,7 @@
> 
>  	if (flags & (SERIO_PARITY|SERIO_TIMEOUT)) {
>  		if (psmouse->state == PSMOUSE_ACTIVATED)
> -			printk(KERN_WARNING "psmouse.c: bad data from KBC 
> -%s%s\n",
> +			printk(KERN_WARNING "%s: bad data from KBC 
> -%s%s\n",__FUNCTION__,

Please use the dev_warn() and friend functions instead.  It gives you a
much better, and standardized, solution.

thanks,

greg k-h

--===============43717981007234585==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43717981007234585==--
