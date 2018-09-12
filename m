From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 12 Sep 2018 01:09:22 +0000
Subject: Re: [PATCH] scsi: qla2xxx: Fix an endian bug in fcpcmd_is_corrupted()
Message-Id: <yq17ejry119.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180908084227.xo4g5aekndokopus@kili.mountain>
In-Reply-To: <20180908084227.xo4g5aekndokopus@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> We should first do the le16_to_cpu endian conversion and then apply
> the FCP_CMD_LENGTH_MASK mask.

Applied to 4.19/scsi-fixes, thank you!

-- 
Martin K. Petersen	Oracle Linux Engineering
