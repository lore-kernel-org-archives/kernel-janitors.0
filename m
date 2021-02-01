From: Jens Axboe <axboe@kernel.dk>
Date: Mon, 01 Feb 2021 18:57:16 +0000
Subject: Re: [PATCH] io_uring: Fix NULL dereference in error in io_sqe_files_register()
Message-Id: <76165fad-a61a-a59c-6b6f-d8ae151bed86@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YBfyzmcP1N6jpDjo@mwanda>
In-Reply-To: <YBfyzmcP1N6jpDjo@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Bijan Mottahedeh <bijan.mottahedeh@oracle.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2/1/21 5:23 AM, Dan Carpenter wrote:
> If we hit a "goto out_free;" before the "ctx->file_data" pointer has
> been assigned then it leads to a NULL derefence when we call:
> 
> 	free_fixed_rsrc_data(ctx->file_data);
> 
> We can fix this by moving the assignment earlier.

Applied, thanks Dan.

-- 
Jens Axboe
