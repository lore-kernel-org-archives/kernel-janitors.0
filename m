From: Jens Axboe <axboe@fb.com>
Date: Mon, 01 Aug 2016 20:37:41 +0000
Subject: Re: [PATCH] Include: blkdev: Removed duplicate 'struct request;' declaration.
Message-Id: <d8b3b8a7-b494-8375-a32a-c81c139b8c18@fb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470083753-31585-1-git-send-email-jpittman@redhat.com>
In-Reply-To: <1470083753-31585-1-git-send-email-jpittman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Pittman <jpittman@redhat.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/01/2016 02:35 PM, John Pittman wrote:
> In include/linux/blkdev.h duplicate declarations of the request
> struct exist.  Cleaned up by removing the second, unneeded
> declaration.

Thanks, applied.

-- 
Jens Axboe

