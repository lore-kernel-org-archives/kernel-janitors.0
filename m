From: Tejun Heo <tj@kernel.org>
Date: Mon, 14 Mar 2011 08:58:19 +0000
Subject: Re: [patch] block: NULL dereference on error path in __blkdev_get()
Message-Id: <20110314085819.GJ2005@htj.dyndns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110313205937.GI2008@bicker>
In-Reply-To: <20110313205937.GI2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello,

On Sun, Mar 13, 2011 at 11:59:37PM +0300, Dan Carpenter wrote:
> "disk" is always NULL when we goto out.  There was a check for this
> before, but it was removed in 69e02c59a7d9 "block: Don't check events
> while open is in progress".
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

 Acked-by: Tejun Heo <tj@kernel.org>

Sorry about the trouble.  I hate that function.  :-(

-- 
tejun
