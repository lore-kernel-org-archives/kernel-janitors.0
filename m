From: Jens Axboe <jaxboe@fusionio.com>
Date: Mon, 23 Aug 2010 10:29:14 +0000
Subject: Re: [patch] cciss: handle allocation failure
Message-Id: <4C724D7A.90907@fusionio.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100811223740.GD645@bicker>
In-Reply-To: <20100811223740.GD645@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2010-08-12 00:37, Dan Carpenter wrote:
> If kmalloc() fails then cleanup and return failure (-1).

Applied, thanks.

-- 
Jens Axboe

