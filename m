From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 29 May 2020 09:20:42 +0000
Subject: Re: [PATCH] edac: Fix reference count leak in edac_device_register_sysfs_main_kobj()
Message-Id: <28ebc99f-c0dd-00b2-7a53-9edf0df36c9c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <77d6b960-aedc-c7ce-5df9-f3653bfd500a@web.de>
In-Reply-To: <77d6b960-aedc-c7ce-5df9-f3653bfd500a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Qiushi Wu <wu000273@umn.edu>, linux-edac@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Doug Thompson <dougthompson@xmission.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, James Morse <james.morse@arm.com>, Kangjie Lu <kjlu@umn.edu>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Richter <rrichter@marvell.com>, Tony Luck <tony.luck@intel.com>

…
> +++ b/drivers/edac/edac_device_sysfs.c
> @@ -275,6 +275,7 @@ int edac_device_register_sysfs_main_kobj(struct edac_device_ctl_info *edac_dev)
>
>  	/* Error exit stack */
>  err_kobj_reg:
> +	kobject_put(&edac_dev->kobj);
>  	module_put(edac_dev->owner);
>
>  err_out:

I suggest to modify the affected source code in a different way.

* The label “err_out” can be replaced by direct return statement,
  can't it?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=75caf310d16cc5e2f851c048cd597f5437013368#n456

* I interpret the function implementation in the way
  that that there is only one if branch where clean-up of
  system resources is needed.
  Thus I would prefer to specify corresponding complete exception handling
  directly at this place (instead of using the goto statement).

Regards,
Markus
