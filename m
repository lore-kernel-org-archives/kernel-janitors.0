From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 16 Feb 2017 02:38:09 +0000
Subject: Re: [patch] scsi: megaraid_sas: array overflow in megasas_dump_frame()
Message-Id: <yq1lgt6c12m.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170214163855.GA1687@mwanda>
In-Reply-To: <20170214163855.GA1687@mwanda> (Dan Carpenter's message of "Tue,
        14 Feb 2017 19:38:55 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kashyap Desai <kashyap.desai@broadcom.com>, Shivasharan S <shivasharan.srikanteshwara@broadcom.com>, Sumit Saxena <sumit.saxena@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, megaraidlinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:

Dan> The "sz" variable is in terms of bytes, but we're treating the
Dan> buffer as an array of __le32 so we have to divide by 4.

Dan> Fixes: def0eab3af86 ("scsi: megaraid_sas: enhance debug logs in OCR
Dan> context") Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to 4.11/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
