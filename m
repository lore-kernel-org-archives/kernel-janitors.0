From: Kent Yoder <key@linux.vnet.ibm.com>
Date: Tue, 04 Sep 2012 16:13:30 +0000
Subject: Re: [PATCH] tpm: fix tpm_acpi sparse warning on different address spaces
Message-Id: <20120904161330.GA20588@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120830143839.GA9589@linux.vnet.ibm.com>
 <20120830174556.GD20741@mwanda>
 <20120830192155.GA25524@linux.vnet.ibm.com>
 <20120902163030.GB1840@mwanda>
In-Reply-To: <20120902163030.GB1840@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, tpmdd-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>

On Sun, Sep 02, 2012 at 09:30:30AM -0700, Dan Carpenter wrote:
> Sparse finds that bug as well.  ;)
> 
> drivers/acpi/acpica/tbfadt.c:247:15: warning: incorrect type in assignment (different address spaces)
> drivers/acpi/acpica/tbfadt.c:247:15:    expected struct acpi_table_header *table
> drivers/acpi/acpica/tbfadt.c:247:15:    got void [noderef] <asn:2>*
> drivers/acpi/acpica/tbfadt.c:266:30: warning: incorrect type in argument 1 (different address spaces)
> drivers/acpi/acpica/tbfadt.c:266:30:    expected void [noderef] <asn:2>*logical_address
> drivers/acpi/acpica/tbfadt.c:266:30:    got struct acpi_table_header *table
> 
> It should be memcpy_fromio() probably.

  Thanks Dan, that's clearly better. James, I'll resubmit this one
today.

Thanks,
Kent

