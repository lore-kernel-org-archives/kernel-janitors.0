From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 14 Dec 2019 04:28:46 +0000
Subject: Re: [PATCH 2/2] scsi: ufs: Simplify a condition
Message-Id: <20191214042846.GA19868@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191213104935.wgpq2epaz6zh5zus@kili.mountain>
 <b08b7848-c0da-4438-258c-19ce18fa798c@acm.org>
In-Reply-To: <b08b7848-c0da-4438-258c-19ce18fa798c@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bart Van Assche <bvanassche@acm.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Subhash Jadavani <subhashj@codeaurora.org>, Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Bean Huo <beanhuo@micron.com>, Stanley Chu <stanley.chu@mediatek.com>, Can Guo <cang@codeaurora.org>, Venkat Gopalakrishnan <venkatg@codeaurora.org>, Tomas Winkler <tomas.winkler@intel.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Dec 13, 2019 at 01:05:55PM -0700, Bart Van Assche wrote:
> On 12/13/19 5:49 AM, Dan Carpenter wrote:
> > We know that "check_for_bkops" is non-zero on this side of the ||
> > because it was checked on the other side.
> 
> How about also removing the superfluous parentheses? Anyway:
> 

Around "(req_link_state = UIC_LINK_OFF_STATE)"?  I considered it but
some people like them...

regards,
dan carpenter
