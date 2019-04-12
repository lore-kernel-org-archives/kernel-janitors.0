From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 12 Apr 2019 13:41:15 +0000
Subject: Re: [PATCH][V3] scsi: cxgbi: remove redundant __kfree_skb call on skb and free cst->atid
Message-Id: <20190412134114.GJ6095@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190412083301.25503-1-colin.king@canonical.com>
In-Reply-To: <20190412083301.25503-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Karen Xie <kxie@chelsio.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Looks good to me.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter
