From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 14 Jul 2020 04:58:40 +0000
Subject: Re: [PATCH] scsi: cxgb4i: clean up a debug printk
Message-Id: <159470266468.11195.15363487048120250219.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200713105100.GA251988@mwanda>
In-Reply-To: <20200713105100.GA251988@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Varun Prakash <varun@chelsio.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, kernel-janitors@vger.kernel.org, Austin Kim <austindh.kim@gmail.com>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, linux-scsi@vger.kernel.org

On Mon, 13 Jul 2020 10:51:00 +0000 (UTC), Dan Carpenter wrote:

> The pr_fmt() at the top of the file already includes the __func__ so we
> can remove the duplicative "cxgbi_conn_init_pdu:" from the string here.
> Now it all fits on one  line as well.

Applied to 5.9/scsi-queue, thanks!

[1/1] scsi: cxgb4i: Clean up a debug printk
      https://git.kernel.org/mkp/scsi/c/30f259b4886a

-- 
Martin K. Petersen	Oracle Linux Engineering
