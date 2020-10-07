From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 07 Oct 2020 03:47:48 +0000
Subject: Re: [PATCH] scsi: be2iscsi: Fix a theoretical leak in beiscsi_create_eqs()
Message-Id: <160204240578.16940.13402401013800356061.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200928091300.GD377727@mwanda>
In-Reply-To: <20200928091300.GD377727@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Subbu Seetharaman <subbu.seetharaman@broadcom.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, Jitendra Bhivare <jitendra.bhivare@broadcom.com>, kernel-janitors@vger.kernel.org, Jayamohan Kallickal <jayamohank@HDRedirect-LB5-1afb6e2973825a56.elb.us-east-1.amazonaws.com>, Ketan Mukadam <ketan.mukadam@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org, James Bottomley <James.Bottomley@suse.de>, linux-scsi@vger.kernel.org

On Mon, 28 Sep 2020 12:13:00 +0300, Dan Carpenter wrote:

> The be_fill_queue() function can only fail when "eq_vaddress" is NULL
> and since it's non-NULL here that means the function call can't fail.
> But imagine if it could, then in that situation we would want to store
> the "paddr" so that dma memory can be released.

Applied to 5.10/scsi-queue, thanks!

[1/1] scsi: be2iscsi: Fix a theoretical leak in beiscsi_create_eqs()
      https://git.kernel.org/mkp/scsi/c/38b2db564d9a

-- 
Martin K. Petersen	Oracle Linux Engineering
