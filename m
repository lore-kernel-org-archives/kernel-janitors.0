From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 29 Nov 2016 16:55:02 +0000
Subject: Re: [PATCH] [SCSI] dpt_i2o: Add a missing call to kfree
Message-Id: <yq1a8cins49.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161119174234.20292-1-lambert.quentin@gmail.com>
In-Reply-To: <20161119174234.20292-1-lambert.quentin@gmail.com> (Quentin
        Lambert's message of "Sat, 19 Nov 2016 18:42:34 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: Adaptec OEM Raid Solutions <aacraid@adaptec.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Quentin" = Quentin Lambert <lambert.quentin@gmail.com> writes:

Quentin> Most error branches following the call to kzalloc contain a
Quentin> call to kfree. This patch add these calls where they are
Quentin> missing.

Applied to 4.10/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
