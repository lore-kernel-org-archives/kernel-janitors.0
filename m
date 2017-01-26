From: David Sterba <dsterba@suse.cz>
Date: Thu, 26 Jan 2017 08:40:59 +0000
Subject: Re: [patch] btrfs: white space cleanup in btrfs_log_inode()
Message-Id: <20170126084059.GB11951@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170125151126.GA27572@mwanda>
In-Reply-To: <20170125151126.GA27572@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Mason <clm@fb.com>, Nikolay Borisov <n.borisov.lkml@gmail.com>, Josef Bacik <jbacik@fb.com>, kernel-janitors@vger.kernel.org, linux-btrfs@vger.kernel.org

On Wed, Jan 25, 2017 at 06:11:26PM +0300, Dan Carpenter wrote:
> We accidentally deleted a new line in commit 0921910aa6fe ("btrfs: Make
> btrfs_log_inode take btrfs_inode")

Thanks, I've folded the change to the patch that introduced it.
