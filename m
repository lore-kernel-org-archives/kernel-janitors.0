From: Jens Axboe <axboe@kernel.dk>
Date: Tue, 23 May 2017 14:42:13 +0000
Subject: Re: [PATCH] block: fix an error code in add_partition()
Message-Id: <6691b746-45c7-a366-1a5c-741a369fd4b2@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170523142836.GB28346@elgon.mountain>
In-Reply-To: <20170523142836.GB28346@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Will Drewry <wad@chromium.org>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05/23/2017 08:28 AM, Dan Carpenter wrote:
> We don't set an error code on this path.  It means that we return NULL
> instead of an error pointer and the caller does a NULL dereference.

Thanks Dan, applied.

-- 
Jens Axboe

