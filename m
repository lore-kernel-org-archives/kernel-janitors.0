From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Nov 2019 09:36:41 +0000
Subject: Re: [PATCH] scsi: megaraid_sas: Use common error handling code in megasas_mgmt_ioctl_fw()
Message-Id: <20191105093641.GE10409@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d5c12f05-5a07-b698-ae60-2728330dd378@web.de>
 <CAL2rwxrdOVeO3RT_Y3mk3p-076eMMWm6VVF0C4yiYEWJ0TO5DQ@mail.gmail.com>
In-Reply-To: <CAL2rwxrdOVeO3RT_Y3mk3p-076eMMWm6VVF0C4yiYEWJ0TO5DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sumit Saxena <sumit.saxena@broadcom.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, Linux SCSI List <linux-scsi@vger.kernel.org>, "PDL,MEGARAIDLINUX" <megaraidlinux.pdl@broadcom.com>, "James E. J. Bottomley" <jejb@linux.ibm.com>, Kashyap Desai <kashyap.desai@broadcom.com>, Shivasharan S <shivasharan.srikanteshwara@broadcom.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Chandrakanth Patil <chandrakanth.patil@broadcom.com>, YueHaibing <yuehaibing@huawei.com>

On Tue, Nov 05, 2019 at 02:58:35PM +0530, Sumit Saxena wrote:
> On Fri, Nov 1, 2019 at 3:06 AM Markus Elfring <Markus.Elfring@web.de> wrote:
> >
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Thu, 31 Oct 2019 22:23:02 +0100
> >
> > Move the same error code assignments so that such exception handling
> > can be better reused at the end of this function.
> >
> > This issue was detected by using the Coccinelle software.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> Acked-by: Sumit Saxena <sumit.saxena@broadcom.com>
> 

The code was a lot better originally...  :(

regards,
dan carpenter
