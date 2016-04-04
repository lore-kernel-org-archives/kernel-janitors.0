From: Theodore Ts'o <tytso@mit.edu>
Date: Mon, 04 Apr 2016 06:19:34 +0000
Subject: Re: [patch] ext4 crypto: fix some error handling
Message-Id: <20160404061934.GA4939@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160402044916.GC11775@mwanda>
In-Reply-To: <20160402044916.GC11775@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Apr 02, 2016 at 07:49:16AM +0300, Dan Carpenter wrote:
> We should be testing for -ENOMEM but the minus sign is missing.
> 
> Fixes: c9af28fdd449 ('ext4 crypto: don't let data integrity writebacks fail with ENOMEM')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.

					- Ted
