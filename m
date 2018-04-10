From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 10 Apr 2018 02:09:37 +0000
Subject: Re: [PATCH v2] scsi: cxgb4i: silence overflow warning in t4_uld_rx_handler()
Message-Id: <yq1sh8324ny.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180403085222.GA19927@mwanda>
In-Reply-To: <20180403085222.GA19927@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> Smatch marks skb->data as untrusted so it complains that there is a
> potential overflow here:
>
> 	drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:2111 t4_uld_rx_handler()
> 	error: buffer overflow 'cxgb4i_cplhandlers' 239 <= 255.
>
> In this case, skb->data comes from the hardware or firmware so it's not
> going to overflow unless there is a firmware bug.

Applied to 4.17/scsi-fixes, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
