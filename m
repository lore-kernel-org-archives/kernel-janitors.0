From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 29 Jan 2019 06:33:31 +0000
Subject: Re: [PATCH] scsi: 53c700: pass correct "dev" to dma_alloc_attrs()
Message-Id: <yq1k1ioc6ro.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190124103327.GB25529@kadam>
In-Reply-To: <20190124103327.GB25529@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> The "hostdata->dev" pointer is NULL here.  We set "hostdata->dev = dev;"
> later in the function and we also use "hostdata->dev" when we call
> dma_free_attrs() in NCR_700_release().
>
> This bug predates git version control.

Applied to 5.0/scsi-fixes, thank you!

-- 
Martin K. Petersen	Oracle Linux Engineering
