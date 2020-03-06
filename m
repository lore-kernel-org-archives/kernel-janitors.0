From: Jens Axboe <axboe@kernel.dk>
Date: Fri, 06 Mar 2020 01:55:55 +0000
Subject: Re: [PATCH] io_uring: Fix error handling in __io_compat_recvmsg_copy_hdr()
Message-Id: <8ae4f1e1-9158-4ec8-e6fc-87c836093b89@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200305200544.5wmrfo7hbfybp3w5@kili.mountain>
In-Reply-To: <20200305200544.5wmrfo7hbfybp3w5@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 3/5/20 1:05 PM, Dan Carpenter wrote:
> We need to check if __get_compat_msghdr() fails and return immediately
> on error.  Also if compat_import_iovec() fails then we should return a
> negative error code, but the current behavior is to just return
> success.

Thanks, that certainly looks better... Applied.

-- 
Jens Axboe
