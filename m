From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Date: Sat, 31 Mar 2018 18:07:17 +0000
Subject: Re: [PATCH v2] xen/acpi: off by one in read_acpi_id()
Message-Id: <739884bb-f780-2b85-c3d7-074342f9b957@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180329090153.GA17927@mwanda>
In-Reply-To: <20180329090153.GA17927@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Joao Martins <joao.m.martins@oracle.com>, kernel-janitors@vger.kernel.org



On 03/29/2018 05:01 AM, Dan Carpenter wrote:
> If acpi_id is = nr_acpi_bits, then we access one element beyond the end
> of the acpi_psd[] array or we set one bit beyond the end of the bit map
> when we do __set_bit(acpi_id, acpi_id_present);
> 
> Fixes: 59a568029181 ("xen/acpi-processor: C and P-state driver that uploads said data to hypervisor.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Joao Martins <joao.m.martins@oracle.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>


Applied to for-linus-4.17

-boris

