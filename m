From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 07 Jul 2006 19:56:27 +0000
Subject: Re: [KJ] [Patch] acpi: remove unnecassary check of
Message-Id: <20060707195627.GB7510@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8ef77f2e0607071044u64f2cf23pa22846e77f0fc3af@mail.gmail.com>
In-Reply-To: <8ef77f2e0607071044u64f2cf23pa22846e77f0fc3af@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jul 07, 2006 at 07:44:50PM +0200, tom hisch wrote:
> it removes an unnecassary check of acpi_ac_dir_param.

No. it doesn't. ;-) Every single user of acpi_unlock_ac_dir() passes to
it, guess what? Right, value returned from acpi_lock_ac_dir() which is
valid pointer by that time.

Ditto for battery stuff screenful below.

> --- linux-2.6/drivers/acpi/cm_sbs.c.orig
> +++ linux-2.6/drivers/acpi/cm_sbs.c
> @@ -69,10 +69,10 @@ void acpi_unlock_ac_dir(struct proc_dir_
>  	down(&cm_sbs_sem);
>  	if (acpi_ac_dir_param) {
>  		lock_ac_dir_cnt--;
> -	}
> -	if (lock_ac_dir_cnt = 0 && acpi_ac_dir_param && acpi_ac_dir) {
> -		remove_proc_entry(ACPI_AC_CLASS, acpi_root_dir);
> -		acpi_ac_dir = 0;
> +		if (lock_ac_dir_cnt = 0 && acpi_ac_dir) {
> +			remove_proc_entry(ACPI_AC_CLASS, acpi_root_dir);
> +			acpi_ac_dir = 0;
> +		}
>  	}
>  	up(&cm_sbs_sem);
>  }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
