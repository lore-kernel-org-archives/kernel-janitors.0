From: Kristen Accardi <kristen.c.accardi@intel.com>
Date: Mon, 09 Jan 2006 17:32:13 +0000
Subject: Re: [KJ] hotplug
Message-Id: <1136827933.27771.7.camel@whizzy>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15992464607989976=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200601091133.53146.cneira@srb.cl>
In-Reply-To: <200601091133.53146.cneira@srb.cl>
To: kernel-janitors@vger.kernel.org

--===============15992464607989976==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2006-01-09 at 11:33 +0000, carlos neira wrote:
> Greetings :
> linux-2.6.15-rc7/drivers/pci/hotplug/pciehp_ctrl.c
> linux-2.6.15-rc7/drivers/pci/hotplug/cpqphp_ctrl.c
> linux-2.6.15-rc7/drivers/pci/hotplug/cpci_hotplug_core.c
> 
> Replaced lock_kernel()  with spinlocks , compile tested ok , using it.
> 
> As always if someone knows this patch breaks anything please tell me so.
> 

The proper usage of spin_lock is with a spinlock_t *, also, you cannot
sleep while holding a spinlock, and daemonize may sleep.





--===============15992464607989976==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15992464607989976==--
