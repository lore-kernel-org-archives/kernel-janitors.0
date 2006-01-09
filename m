From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 09 Jan 2006 16:41:14 +0000
Subject: Re: [KJ] hotplug
Message-Id: <20060109164113.GA13159@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41910973726447209=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200601091133.53146.cneira@srb.cl>
In-Reply-To: <200601091133.53146.cneira@srb.cl>
To: kernel-janitors@vger.kernel.org

--===============41910973726447209==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 09, 2006 at 11:33:52AM +0000, carlos neira wrote:
> Replaced lock_kernel()  with spinlocks , compile tested ok ,

Not true.

  CC      drivers/pci/hotplug/cpqphp_ctrl.o
drivers/pci/hotplug/cpqphp_ctrl.c: In function `event_thread':
drivers/pci/hotplug/cpqphp_ctrl.c:1798: warning: passing arg 1 of `_spin_lock' from incompatible pointer type
drivers/pci/hotplug/cpqphp_ctrl.c:1800: warning: passing arg 1 of `_spin_unlock' from incompatible pointer type

> using it.

Well, I'm impressed.

> diff -uN /usr/src/linux-2.6.15-rc7/drivers/pci/hotplug/cpci_hotplug_core.c /home/cneira/Linuxjanitoring/linux-janitorpatching/drivers/pci/hotplug/cpci_hotplug_core.c
> --- /usr/src/linux-2.6.15-rc7/drivers/pci/hotplug/cpci_hotplug_core.c	2005-12-24 20:47:48.000000000 -0300
> +++ /home/cneira/Linuxjanitoring/linux-janitorpatching/drivers/pci/hotplug/cpci_hotplug_core.c	2006-01-08 23:41:07.000000000 -0300
> @@ -525,9 +526,9 @@
>  {
>  	int rc;
>  
> -	lock_kernel();
> +	spin_lock(&event_thread);
>  	daemonize("cpci_hp_eventd");
> -	unlock_kernel();
> +	spin_unlock(&event_thread);

static int
event_thread(void *data)


--===============41910973726447209==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41910973726447209==--
