From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 14 Mar 2019 11:02:30 +0000
Subject: Re: [PATCH] scsi: lpfc: Fix error codes in lpfc_sli4_pci_mem_setup()
Message-Id: <yq136npoh15.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190307053344.GA4517@kadam>
In-Reply-To: <20190307053344.GA4517@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> It used to be that "error" was set to -ENODEV at the start of the
> function but we shifted some code around an now "error" is set to zero
> for most error paths.  There is a mix of direct returns and "goto out"
> but I changed everything to direct returns for consistency.

Applied to 5.1/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
