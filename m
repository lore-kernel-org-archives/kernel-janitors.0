From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 17 Dec 2019 03:04:52 +0000
Subject: Re: [PATCH 1/2] scsi: ufs: Unlock on a couple error paths
Message-Id: <yq1lfrbhctn.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191213104828.7i64cpoof26rc4fw@kili.mountain>
In-Reply-To: <20191213104828.7i64cpoof26rc4fw@kili.mountain> (Dan Carpenter's
        message of "Fri, 13 Dec 2019 13:48:28 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Bean Huo <beanhuo@micron.com>, Stanley Chu <stanley.chu@mediatek.com>, Can Guo <cang@codeaurora.org>, Venkat Gopalakrishnan <venkatg@codeaurora.org>, Tomas Winkler <tomas.winkler@intel.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> We introduced a few new error paths, but we can't return directly, we
> first have to unlock "hba->clk_scaling_lock" first.

Applied #1 + #2 to 5.6/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
