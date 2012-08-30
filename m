From: Kent Yoder <key@linux.vnet.ibm.com>
Date: Thu, 30 Aug 2012 14:32:34 +0000
Subject: Re: [security:next 2/13] drivers/char/tpm/tpm_acpi.c:98:14: sparse: incorrect type in assignment (di
Message-Id: <20120830143234.GA4991@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Fengguang,

On Mon, Aug 27, 2012 at 04:02:30PM -0700, Fengguang Wu wrote:
> Hi Kent,
> 
> FYI, there are new sparse warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git next
> head:   f84fdff0fdcda7e509ce530e0ee612233a2104fb
> commit: e5dcd87fee12ed64a9ea911102025facc0c7d10c [2/13] tpm: modularize event log collection
> config: i386-allmodconfig (attached as .config)
> 
> All sparse warnings:
> 
> + drivers/char/tpm/tpm_acpi.c:98:14: sparse: incorrect type in assignment (different address spaces)
>   drivers/char/tpm/tpm_acpi.c:98:14:    expected struct acpi_table_header *virt
>   drivers/char/tpm/tpm_acpi.c:98:14:    got void [noderef] <asn:2>*
> + drivers/char/tpm/tpm_acpi.c:102:30: sparse: incorrect type in argument 1 (different address spaces)
>   drivers/char/tpm/tpm_acpi.c:102:30:    expected void [noderef] <asn:2>*logical_address
>   drivers/char/tpm/tpm_acpi.c:102:30:    got struct acpi_table_header *virt
> 
> vim +98 drivers/char/tpm/tpm_acpi.c
>     95	
>     96		log->bios_event_log_end = log->bios_event_log + len;
>     97	
>   > 98		virt = acpi_os_map_memory(start, len);
>     99	
>    100		memcpy(log->bios_event_log, virt, len);
>    101	

  This code is now slightly different based on James' lastest updates,
so I'll send the update to James for this.

Thanks,
Kent

