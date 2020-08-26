From: Jens Axboe <axboe@kernel.dk>
Date: Wed, 26 Aug 2020 13:29:43 +0000
Subject: Re: [PATCH] rnbd: Fix an error code in process_rdma()
Message-Id: <172d1b3a-58e6-1a50-2b6a-1e797135d5af@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200826113242.GC393664@mwanda>
In-Reply-To: <20200826113242.GC393664@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Danil Kipnis <danil.kipnis@cloud.ionos.com>
Cc: Jack Wang <jinpu.wang@cloud.ionos.com>, Guoqing Jiang <guoqing.jiang@cloud.ionos.com>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On 8/26/20 5:32 AM, Dan Carpenter wrote:
> The error code is uninitialized on this error path.

The fix is in Linus's tree:

commit 17bc10300c69bd51b82983cdadafa0a7791f074e
Author: Nathan Chancellor <natechancellor@gmail.com>
Date:   Mon Aug 17 23:49:25 2020 -0700

    block/rnbd: Ensure err is always initialized in process_rdma


-- 
Jens Axboe
