From: Jens Axboe <axboe@kernel.dk>
Date: Wed, 06 Jan 2021 14:29:09 +0000
Subject: Re: [PATCH] io_uring: fix an IS_ERR() vs NULL check
Message-Id: <d2da0e81-434c-24d3-8eb8-cccc391f481f@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X/WCTxIRT4SHLemV@mwanda>
In-Reply-To: <X/WCTxIRT4SHLemV@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Pavel Begunkov <asml.silence@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 1/6/21 2:26 AM, Dan Carpenter wrote:
> The alloc_fixed_file_ref_node() function never returns NULL, it returns
> error pointers on error.

Applied, thanks.

-- 
Jens Axboe
