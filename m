From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Thu, 01 Feb 2018 22:49:17 +0000
Subject: Re: [PATCH 0/2] RDMA/bnxt_re: Adjustments for bnxt_qplib_alloc_dpi_tbl()
Message-Id: <20180201224917.GA8590@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <19c755a6-8c52-bbd5-a425-48fc08cecd4f@users.sourceforge.net>
In-Reply-To: <19c755a6-8c52-bbd5-a425-48fc08cecd4f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-rdma@vger.kernel.org, Devesh Sharma <devesh.sharma@broadcom.com>, Doug Ledford <dledford@redhat.com>, Selvin Xavier <selvin.xavier@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Himanshu Jha <himanshujha199640@gmail.com>, Jonathan Toppins <jtoppins@redhat.com>

On Sat, Jan 27, 2018 at 09:15:09PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 27 Jan 2018 21:10:12 +0100
> 
> Two update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (2):
>   Delete two error messages for a failed memory allocation
>   Use common error handling code

Applied to for-next with Jonathan and Devesh's ack, thanks all

Jason
