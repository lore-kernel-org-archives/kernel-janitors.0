From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 08 Jan 2016 17:51:55 +0000
Subject: Re: [patch] storvsc: fix typo in MODULE_PARM_DESC
Message-Id: <yq1bn8wez7o.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160108110204.GH32195@mwanda>
In-Reply-To: <20160108110204.GH32195@mwanda> (Dan Carpenter's message of "Fri,
 8 Jan 2016 14:02:04 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>, "James E.J. Bottomley" <JBottomley@odin.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, devel@linuxdriverproject.org

>>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:

Dan> The module_param is "storvsc_vcpus_per_sub_channel" so we need to
Dan> use that for MODULE_PARM_DESC() as well.

Applied to 4.5/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
