From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 27 May 2020 02:12:54 +0000
Subject: Re: [PATCH] scsi: cxgb3i: fix some leaks in init_act_open()
Message-Id: <159054550935.12032.3078033061151944751.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200521121221.GA247492@mwanda>
In-Reply-To: <20200521121221.GA247492@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Karen Xie <kxie@chelsio.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, James Bottomley <James.Bottomley@suse.de>, Mike Christie <michaelc@cs.wisc.edu>, "James E.J. Bottomley" <jejb@linux.ibm.com>, kernel-janitors@vger.kernel.org

On Thu, 21 May 2020 15:12:21 +0300, Dan Carpenter wrote:

> There wasn't any clean up done if cxgb3_alloc_atid() failed and also the
> original code didn't release "csk->l2t".

Applied to 5.8/scsi-queue, thanks!

[1/1] scsi: cxgb3i: Fix some leaks in init_act_open()
      https://git.kernel.org/mkp/scsi/c/b6170a49c59c

-- 
Martin K. Petersen	Oracle Linux Engineering
