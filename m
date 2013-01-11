From: Jens Axboe <axboe@kernel.dk>
Date: Fri, 11 Jan 2013 10:27:56 +0000
Subject: Re: [patch] dac960: return success instead of -ENOTTY
Message-Id: <50EFE92C.4080209@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130111065244.GD13207@elgon.mountain>
In-Reply-To: <20130111065244.GD13207@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Danny Kukawka <danny.kukawka@bisect.de>, Jesper Juhl <jj@chaosbits.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2013-01-11 07:52, Dan Carpenter wrote:
> There is a missing break statement here.  This used to return directly
> but we re-worked it in 2008 to add locking as part of the BKL push down.

Thanks Dan, applied. Must have a big user base...

-- 
Jens Axboe

