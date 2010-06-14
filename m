From: Johannes Hirte <johannes.hirte@fem.tu-ilmenau.de>
Date: Mon, 14 Jun 2010 21:45:40 +0000
Subject: Re: [patch 11/11] btrfs: The file argument for fsync() is never null
Message-Id: <201006142345.42014.johannes.hirte@fem.tu-ilmenau.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100529094907.GL5483@bicker> <20100614211120.GB5483@bicker> <20100614211601.GA27420@lst.de>
In-Reply-To: <20100614211601.GA27420@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: Dan Carpenter <error27@gmail.com>, linux-btrfs@vger.kernel.org, Yan Zheng <zheng.yan@oracle.com>, Josef Bacik <josef@redhat.com>, Chris Mason <chris.mason@oracle.com>, kernel-janitors@vger.kernel.org

Am Montag 14 Juni 2010, 23:16:01 schrieb Christoph Hellwig:
> On Mon, Jun 14, 2010 at 11:11:20PM +0200, Dan Carpenter wrote:
> > > Looks like you've applied the patch to a far too old kernel.  It can't
> > > be NULL for quite a while already.
> > 
> > You're the expert, but it looks like it could be null in 2.6.34 like he
> > says.  I'm just looking at vfs_fsync_range() in
> > "git show v2.6.34:fs/sync.c".
> 
> 2.6.34 is far too old.

For the changes yes, but not for working. I needed the btrfs fixes without all 
the other bugs introduced with 2.6.35-rc. I was to careless and pulled to much 
changes in. My fault.

regards,
  Johannes
