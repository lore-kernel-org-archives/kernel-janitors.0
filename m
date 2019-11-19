From: Jens Axboe <axboe@kernel.dk>
Date: Tue, 19 Nov 2019 15:45:25 +0000
Subject: Re: [PATCH] io-wq: remove extra space characters
Message-Id: <ac841162-db41-0c8b-6ff8-d5b956961582@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119062216.qhxmnrt2rdioirja@kili.mountain>
In-Reply-To: <20191119062216.qhxmnrt2rdioirja@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/18/19 11:22 PM, Dan Carpenter wrote:
> These lines are indented an extra space character.

Thanks, applied.

> We often see this where the lines after a comment are indented one
> space extra.  I don't know if it's an editor thing maybe?

I think I can explain that. I recently decided to try and use the
vim auto-indent, to see if it'd make my life a little easier to
save on typing. Unfortunately it has a bug where it indents that
extra space following a comment form like:

/*
 * bla bla
 */

which is exactly what happened here. As diff doesn't show that
as extra whitespace you can miss that it happened.

-- 
Jens Axboe
