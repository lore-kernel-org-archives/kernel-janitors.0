From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 30 Apr 2019 09:26:19 +0000
Subject: Re: [PATCH v2 2/2] io_uring: Potential Oops in io_sq_offload_start()
Message-Id: <20190430092619.GC2239@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190404104527.GX4038@hirez.programming.kicks-ass.net>
 <20190408081513.GB15239@kadam>
In-Reply-To: <20190408081513.GB15239@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>
Cc: Amritha Nambiar <amritha.nambiar@intel.com>, Willem de Bruijn <willemb@google.com>, kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>

The io_uring patches are slated for v5.7 so we should figure out a
solution for this bug.

regrds,
dan carpenter
