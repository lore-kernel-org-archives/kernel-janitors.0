From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 30 Apr 2020 02:18:02 +0000
Subject: Re: [PATCH] scsi: qedi: Check for buffer overflow in qedi_set_path()
Message-Id: <158821297687.28621.14243735902827937785.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428131939.GA696531@mwanda>
In-Reply-To: <20200428131939.GA696531@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QLogic-Storage-Upstream@cavium.com, Dan Carpenter <dan.carpenter@oracle.com>, Manish Rangankar <manish.rangankar@cavium.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, kernel-janitors@vger.kernel.org

On Tue, 28 Apr 2020 16:19:39 +0300, Dan Carpenter wrote:

> Smatch complains that the "path_data->handle" variable is user
> controlled.  It comes from iscsi_set_path() so that seems possible.
> It's harmless to add a limit check.
> 
> The qedi->ep_tbl[] array has qedi->max_active_conns elements (which is
> always ISCSI_MAX_SESS_PER_HBA (4096) elements).  The array is allocated
> in the qedi_cm_alloc_mem() function.

Applied to 5.8/scsi-queue, thanks!

[1/1] scsi: qedi: Check for buffer overflow in qedi_set_path()
      https://git.kernel.org/mkp/scsi/c/4a4c0cfb4be7

-- 
Martin K. Petersen	Oracle Linux Engineering
