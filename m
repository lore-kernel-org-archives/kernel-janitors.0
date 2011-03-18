From: Tejun Heo <tj@kernel.org>
Date: Fri, 18 Mar 2011 08:32:02 +0000
Subject: Re: [patch] block: NULL dereference on error path in __blkdev_get()
Message-Id: <20110318083202.GC8571@htj.dyndns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110313205937.GI2008@bicker>
 <20110314085819.GJ2005@htj.dyndns.org>
In-Reply-To: <20110314085819.GJ2005@htj.dyndns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Mar 14, 2011 at 09:58:19AM +0100, Tejun Heo wrote:
> Hello,
> 
> On Sun, Mar 13, 2011 at 11:59:37PM +0300, Dan Carpenter wrote:
> > "disk" is always NULL when we goto out.  There was a check for this
> > before, but it was removed in 69e02c59a7d9 "block: Don't check events
> > while open is in progress".
> > 
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
>  Acked-by: Tejun Heo <tj@kernel.org>
> 
> Sorry about the trouble.  I hate that function.  :-(

I thought Jens was cc'd.  I'll forward the patch to him & LKML.

Thanks.

-- 
tejun
