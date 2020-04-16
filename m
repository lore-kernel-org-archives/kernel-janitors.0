From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Apr 2020 13:08:47 +0000
Subject: Re: [PATCH] RDMA/ocrdma: Fix an off-by-one issue in 'ocrdma_add_stat'
Message-Id: <20200416130847.GP1163@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200328073040.24429-1-christophe.jaillet@wanadoo.fr>
 <20200414183441.GA28870@ziepe.ca>
In-Reply-To: <20200414183441.GA28870@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, selvin.xavier@broadcom.com, devesh.sharma@broadcom.com, dledford@redhat.com, leon@kernel.org, colin.king@canonical.com, roland@purestorage.com, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Apr 14, 2020 at 03:34:41PM -0300, Jason Gunthorpe wrote:
> The memcpy is still kind of silly right? What about this:
> 
> static int ocrdma_add_stat(char *start, char *pcur, char *name, u64 count)
> {
> 	size_t len = (start + OCRDMA_MAX_DBGFS_MEM) - pcur;
> 	int cpy_len;
> 
> 	cpy_len = snprintf(pcur, len, "%s: %llu\n", name, count);
> 	if (cpy_len >= len || cpy_len < 0) {

The kernel version of snprintf() doesn't and will never return
negatives.  It would cause a huge security headache if it started
returning negatives.

> 		pr_err("%s: No space in stats buff\n", __func__);
> 		return 0;
> 	}

regards,
dan carpenter
