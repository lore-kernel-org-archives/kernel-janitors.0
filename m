From: Bart Van Assche <bvanassche@acm.org>
Date: Fri, 13 Dec 2019 20:05:55 +0000
Subject: Re: [PATCH 2/2] scsi: ufs: Simplify a condition
Message-Id: <b08b7848-c0da-4438-258c-19ce18fa798c@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191213104935.wgpq2epaz6zh5zus@kili.mountain>
In-Reply-To: <20191213104935.wgpq2epaz6zh5zus@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alim Akhtar <alim.akhtar@samsung.com>, Subhash Jadavani <subhashj@codeaurora.org>
Cc: Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Bean Huo <beanhuo@micron.com>, Stanley Chu <stanley.chu@mediatek.com>, Can Guo <cang@codeaurora.org>, Venkat Gopalakrishnan <venkatg@codeaurora.org>, Tomas Winkler <tomas.winkler@intel.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On 12/13/19 5:49 AM, Dan Carpenter wrote:
> We know that "check_for_bkops" is non-zero on this side of the ||
> because it was checked on the other side.

How about also removing the superfluous parentheses? Anyway:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
