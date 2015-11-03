From: Jens Axboe <axboe@fb.com>
Date: Tue, 03 Nov 2015 23:02:08 +0000
Subject: Re: [patch] nvme: lightnvm: clean up a data type
Message-Id: <56393CF0.9050509@fb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151103223731.GE19280@mwanda>
In-Reply-To: <20151103223731.GE19280@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11/03/2015 03:37 PM, Dan Carpenter wrote:
> "nlb_pr_rq" can't be more than u32 because "len" is a u32.  Later we
> truncate it to u32 anyway when we calculate min_t().

Thanks Dan, applied.

-- 
Jens Axboe

