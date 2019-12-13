From: Bart Van Assche <bvanassche@acm.org>
Date: Fri, 13 Dec 2019 20:04:44 +0000
Subject: Re: [PATCH 1/2] scsi: ufs: Unlock on a couple error paths
Message-Id: <70d90cda-afe7-30bd-c871-c9d37bee98aa@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191213104828.7i64cpoof26rc4fw@kili.mountain>
In-Reply-To: <20191213104828.7i64cpoof26rc4fw@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Bean Huo <beanhuo@micron.com>, Stanley Chu <stanley.chu@mediatek.com>, Can Guo <cang@codeaurora.org>, Venkat Gopalakrishnan <venkatg@codeaurora.org>, Tomas Winkler <tomas.winkler@intel.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On 12/13/19 5:48 AM, Dan Carpenter wrote:
> We introduced a few new error paths, but we can't return directly, we
> first have to unlock "hba->clk_scaling_lock" first.

This may have escaped from my attention due to having swapped the order 
of the patch that removed that locking and the patch this patch is a fix 
for. Anyway, thanks for this patch.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
