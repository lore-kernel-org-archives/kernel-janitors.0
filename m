From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Fri, 04 Mar 2005 15:47:03 +0000
Subject: Re: [KJ] linux-2.6.9: psmouse fix names
Message-Id: <422882F7.60404@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <42282D69.90404@bfs.de>
In-Reply-To: <42282D69.90404@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

walter harms wrote:
> Hi list,
> 
> the psmouse driver reports the name "psmouse.c" with error messages. 
> Since there is a psmouse.o but no .c this is confusing. (at least to 
> me). this patch changes the hardcoded names to __FUNCTION__.

Patch does not apply cleanly to 2.6.11.

It would make sense to me to report which module is producing these
warning messages, and since psmouse.c is not correct, maybe do what
some other drivers do and

#define PREFIX		"psmouse:"
or
#define MODNAME		"psmouse"

and use that it all messages.

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
> --- linux-2.6.9/drivers/input/mouse/psmouse-base.c.bak    2005-03-03 
> 22:18:49.000000000 +0100
> +++ linux-2.6.9/drivers/input/mouse/psmouse-base.c    2005-03-03 
> 22:38:57.000000000 +0100
> @@ -141,7 +141,7 @@
> 
>      if (flags & (SERIO_PARITY|SERIO_TIMEOUT)) {
>          if (psmouse->state = PSMOUSE_ACTIVATED)
> -            printk(KERN_WARNING "psmouse.c: bad data from KBC -%s%s\n",
> +            printk(KERN_WARNING "%s: bad data from KBC 
> -%s%s\n",__FUNCTION__,
>                  flags & SERIO_TIMEOUT ? " timeout" : "",
>                  flags & SERIO_PARITY ? " bad parity" : "");
>          psmouse->nak = 1;
> @@ -207,7 +207,7 @@
> 
>      if (psmouse->state = PSMOUSE_ACTIVATED &&
>          psmouse->pktcnt && time_after(jiffies, psmouse->last + HZ/2)) {
> -        printk(KERN_WARNING "psmouse.c: %s at %s lost synchronization, 
> throwing %d bytes away.\n",
> +        printk(KERN_WARNING "%s: %s at %s lost synchronization, 
> throwing %d bytes away.\n",__FUNCTION__,
>                 psmouse->name, psmouse->phys, psmouse->pktcnt);
>          psmouse->pktcnt = 0;
>      }
> @@ -239,13 +239,13 @@
> 
>      switch (rc) {
>          case PSMOUSE_BAD_DATA:
> -            printk(KERN_WARNING "psmouse.c: %s at %s lost sync at byte 
> %d\n",
> +            printk(KERN_WARNING "%s: %s at %s lost sync at byte 
> %d\n",__FUNCTION__,
>                  psmouse->name, psmouse->phys, psmouse->pktcnt);
>              psmouse->pktcnt = 0;
> 
>              if (++psmouse->out_of_sync = psmouse_resetafter) {
>                  psmouse->state = PSMOUSE_IGNORE;
> -                printk(KERN_NOTICE "psmouse.c: issuing reconnect 
> request\n");
> +                printk(KERN_NOTICE "%s: issuing reconnect 
> request\n",__FUNCTION__);
>                  serio_reconnect(psmouse->serio);
>              }
>              break;
> @@ -254,7 +254,7 @@
>              psmouse->pktcnt = 0;
>              if (psmouse->out_of_sync) {
>                  psmouse->out_of_sync = 0;
> -                printk(KERN_NOTICE "psmouse.c: %s at %s - driver 
> resynched.\n",
> +                printk(KERN_NOTICE "%s: %s at %s - driver 
> resynched.\n",__FUNCTION__,
>                      psmouse->name, psmouse->phys);
>              }
>              break;
> @@ -581,7 +581,7 @@
>   */
> 
>      if (psmouse_command(psmouse, NULL, PSMOUSE_CMD_RESET_DIS))
> -        printk(KERN_WARNING "psmouse.c: Failed to reset mouse on %s\n", 
> psmouse->serio->phys);
> +        printk(KERN_WARNING "%s: Failed to reset mouse on 
> %s\n",__FUNCTION__, psmouse->serio->phys);
> 
>      return 0;
>  }
> @@ -671,7 +671,7 @@
>  static void psmouse_activate(struct psmouse *psmouse)
>  {
>      if (psmouse_command(psmouse, NULL, PSMOUSE_CMD_ENABLE))
> -        printk(KERN_WARNING "psmouse.c: Failed to enable mouse on 
> %s\n", psmouse->serio->phys);
> +        printk(KERN_WARNING "%s: Failed to enable mouse on 
> %s\n",__FUNCTION__, psmouse->serio->phys);
> 
>      psmouse_set_state(psmouse, PSMOUSE_ACTIVATED);
>  }
> @@ -685,7 +685,7 @@
>  static void psmouse_deactivate(struct psmouse *psmouse)
>  {
>      if (psmouse_command(psmouse, NULL, PSMOUSE_CMD_DISABLE))
> -        printk(KERN_WARNING "psmouse.c: Failed to deactivate mouse on 
> %s\n", psmouse->serio->phys);
> +        printk(KERN_WARNING "%s: Failed to deactivate mouse on 
> %s\n",__FUNCTION__, psmouse->serio->phys);
> 
>      psmouse_set_state(psmouse, PSMOUSE_CMD_MODE);
>  }
> @@ -814,7 +814,8 @@
>           * Nothing to be done here, serio core will detect that
>           * the driver set serio->child and will register it for us.
>           */
> -        printk(KERN_INFO "serio: %s port at %s\n", serio->child->name, 
> psmouse->phys);
> +        printk(KERN_INFO "%s: serio: %s port at %s\n",__FUNCTION__, 
> serio->child->name, psmouse->phys);
> +
>      }
> 
>      psmouse_activate(psmouse);
> @@ -834,7 +835,7 @@
>      int rc = -1;
> 
>      if (!drv || !psmouse) {
> -        printk(KERN_DEBUG "psmouse: reconnect request, but serio is 
> disconnected, ignoring...\n");
> +        printk(KERN_DEBUG "%s: reconnect request, but serio is 
> disconnected, ignoring...\n",__FUNCTION__);
>          return -1;
>      }
> 
> @@ -896,7 +897,7 @@
>          else if (!strcmp(psmouse_proto, "exps"))
>              psmouse_max_proto = PSMOUSE_IMEX;
>          else
> -            printk(KERN_ERR "psmouse: unknown protocol type '%s'\n", 
> psmouse_proto);
> +            printk(KERN_ERR "%s: unknown protocol type '%s'\n", 
> __FUNCTION__, psmouse_proto);
>      }
>  }
> 
> 
> ------------------------------------------------------------------------
> 
> --- linux-2.6.9/drivers/input/mouse/psmouse-base.c.bak	2005-03-03 22:18:49.000000000 +0100
> +++ linux-2.6.9/drivers/input/mouse/psmouse-base.c	2005-03-03 22:38:57.000000000 +0100
> @@ -141,7 +141,7 @@
>  
>  	if (flags & (SERIO_PARITY|SERIO_TIMEOUT)) {
>  		if (psmouse->state = PSMOUSE_ACTIVATED)
> -			printk(KERN_WARNING "psmouse.c: bad data from KBC -%s%s\n",
> +			printk(KERN_WARNING "%s: bad data from KBC -%s%s\n",__FUNCTION__,
>  				flags & SERIO_TIMEOUT ? " timeout" : "",
>  				flags & SERIO_PARITY ? " bad parity" : "");
>  		psmouse->nak = 1;
> @@ -207,7 +207,7 @@
>  
>  	if (psmouse->state = PSMOUSE_ACTIVATED &&
>  	    psmouse->pktcnt && time_after(jiffies, psmouse->last + HZ/2)) {
> -		printk(KERN_WARNING "psmouse.c: %s at %s lost synchronization, throwing %d bytes away.\n",
> +		printk(KERN_WARNING "%s: %s at %s lost synchronization, throwing %d bytes away.\n",__FUNCTION__,
>  		       psmouse->name, psmouse->phys, psmouse->pktcnt);
>  		psmouse->pktcnt = 0;
>  	}
> @@ -239,13 +239,13 @@
>  
>  	switch (rc) {
>  		case PSMOUSE_BAD_DATA:
> -			printk(KERN_WARNING "psmouse.c: %s at %s lost sync at byte %d\n",
> +			printk(KERN_WARNING "%s: %s at %s lost sync at byte %d\n",__FUNCTION__,
>  				psmouse->name, psmouse->phys, psmouse->pktcnt);
>  			psmouse->pktcnt = 0;
>  
>  			if (++psmouse->out_of_sync = psmouse_resetafter) {
>  				psmouse->state = PSMOUSE_IGNORE;
> -				printk(KERN_NOTICE "psmouse.c: issuing reconnect request\n");
> +				printk(KERN_NOTICE "%s: issuing reconnect request\n",__FUNCTION__);
>  				serio_reconnect(psmouse->serio);
>  			}
>  			break;
> @@ -254,7 +254,7 @@
>  			psmouse->pktcnt = 0;
>  			if (psmouse->out_of_sync) {
>  				psmouse->out_of_sync = 0;
> -				printk(KERN_NOTICE "psmouse.c: %s at %s - driver resynched.\n",
> +				printk(KERN_NOTICE "%s: %s at %s - driver resynched.\n",__FUNCTION__,
>  					psmouse->name, psmouse->phys);
>  			}
>  			break;
> @@ -581,7 +581,7 @@
>   */
>  
>  	if (psmouse_command(psmouse, NULL, PSMOUSE_CMD_RESET_DIS))
> -		printk(KERN_WARNING "psmouse.c: Failed to reset mouse on %s\n", psmouse->serio->phys);
> +		printk(KERN_WARNING "%s: Failed to reset mouse on %s\n",__FUNCTION__, psmouse->serio->phys);
>  
>  	return 0;
>  }
> @@ -671,7 +671,7 @@
>  static void psmouse_activate(struct psmouse *psmouse)
>  {
>  	if (psmouse_command(psmouse, NULL, PSMOUSE_CMD_ENABLE))
> -		printk(KERN_WARNING "psmouse.c: Failed to enable mouse on %s\n", psmouse->serio->phys);
> +		printk(KERN_WARNING "%s: Failed to enable mouse on %s\n",__FUNCTION__, psmouse->serio->phys);
>  
>  	psmouse_set_state(psmouse, PSMOUSE_ACTIVATED);
>  }
> @@ -685,7 +685,7 @@
>  static void psmouse_deactivate(struct psmouse *psmouse)
>  {
>  	if (psmouse_command(psmouse, NULL, PSMOUSE_CMD_DISABLE))
> -		printk(KERN_WARNING "psmouse.c: Failed to deactivate mouse on %s\n", psmouse->serio->phys);
> +		printk(KERN_WARNING "%s: Failed to deactivate mouse on %s\n",__FUNCTION__, psmouse->serio->phys);
>  
>  	psmouse_set_state(psmouse, PSMOUSE_CMD_MODE);
>  }
> @@ -814,7 +814,8 @@
>  		 * Nothing to be done here, serio core will detect that
>  		 * the driver set serio->child and will register it for us.
>  		 */
> -		printk(KERN_INFO "serio: %s port at %s\n", serio->child->name, psmouse->phys);
> +		printk(KERN_INFO "%s: serio: %s port at %s\n",__FUNCTION__, serio->child->name, psmouse->phys);
> +
>  	}
>  
>  	psmouse_activate(psmouse);
> @@ -834,7 +835,7 @@
>  	int rc = -1;
>  
>  	if (!drv || !psmouse) {
> -		printk(KERN_DEBUG "psmouse: reconnect request, but serio is disconnected, ignoring...\n");
> +		printk(KERN_DEBUG "%s: reconnect request, but serio is disconnected, ignoring...\n",__FUNCTION__);
>  		return -1;
>  	}
>  
> @@ -896,7 +897,7 @@
>  		else if (!strcmp(psmouse_proto, "exps"))
>  			psmouse_max_proto = PSMOUSE_IMEX;
>  		else
> -			printk(KERN_ERR "psmouse: unknown protocol type '%s'\n", psmouse_proto);
> +			printk(KERN_ERR "%s: unknown protocol type '%s'\n", __FUNCTION__, psmouse_proto);


-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
