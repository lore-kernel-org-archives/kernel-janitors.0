From: Jens Axboe <jens.axboe@oracle.com>
Date: Fri, 02 Apr 2010 06:39:58 +0000
Subject: Re: [patch] cciss: unlock on error path
Message-Id: <20100402063958.GS23510@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100401155404.GD5265@bicker>
In-Reply-To: <20100401155404.GD5265@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mike Miller <mike.miller@hp.com>, "Stephen M. Cameron" <scameron@beardog.cce.hp.com>, Andrew Morton <akpm@linux-foundation.org>, iss_storagedev@hp.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Apr 01 2010, Dan Carpenter wrote:
> We take the spin_lock again in fail_all_cmds() so we need to unlock
> here.

Thanks Dan, applied.

-- 
Jens Axboe

