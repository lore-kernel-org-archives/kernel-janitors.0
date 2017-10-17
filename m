From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 17 Oct 2017 02:36:23 +0000
Subject: Re: [PATCH] [SCSI] bfa: integer overflow in debugfs
Message-Id: <yq11sm233h4.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171004075037.j7pkdqqcegvba44e@mwanda>
In-Reply-To: <20171004075037.j7pkdqqcegvba44e@mwanda> (Dan Carpenter's message
        of "Wed, 4 Oct 2017 10:50:37 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Anil Gurumurthy <anil.gurumurthy@qlogic.com>, Jing Huang <huangj@brocade.com>, Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> We could allocate less memory than intended because we do:
>
> 	bfad->regdata = kzalloc(len << 2, GFP_KERNEL);
>
> The shift can overflow leading to a crash.  This is debugfs code so the
> impact is very small.  I fixed the network version of this in March with
> commit 13e2d5187f6b ("bna: integer overflow bug in debugfs").

Applied to 4.15/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
