From: James Smart <james.smart@broadcom.com>
Date: Wed, 13 Mar 2019 20:55:33 +0000
Subject: Re: [PATCH] scsi: lpfc: Fix error codes in lpfc_sli4_pci_mem_setup()
Message-Id: <94bb3b69-f085-6c13-2b72-892a2396f2ee@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190307053344.GA4517@kadam>
In-Reply-To: <20190307053344.GA4517@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org



On 3/6/2019 9:33 PM, Dan Carpenter wrote:
> It used to be that "error" was set to -ENODEV at the start of the
> function but we shifted some code around an now "error" is set to
> zero for most error paths.  There is a mix of direct returns and
> "goto out" but I changed everything to direct returns for consistency.
>
> Fixes: 56de8357049c ("scsi: lpfc: fix calls to dma_set_mask_and_coherent()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/scsi/lpfc/lpfc_init.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
>
>

Reviewed-by:  James Smart  <james.smart@broadcom.com>

Thanks

-- james
