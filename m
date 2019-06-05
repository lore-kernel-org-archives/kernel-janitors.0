From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 05 Jun 2019 02:23:05 +0000
Subject: Re: [PATCH] scsi: smartpqi: unlock on error in pqi_submit_raid_request_synchronous()
Message-Id: <yq1v9xkrcs6.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> We need to drop the "ctrl_info->sync_request_sem" lock before returning.

Applied to 5.2/scsi-fixes, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
