From: David Sterba <dsterba@suse.cz>
Date: Thu, 31 Oct 2019 11:42:02 +0000
Subject: Re: [PATCH] btrfs: clean up locking name in scrub_enumerate_chunks()
Message-Id: <20191031114202.GF3001@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191031105501.GB26612@mwanda>
In-Reply-To: <20191031105501.GB26612@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Oct 31, 2019 at 01:55:01PM +0300, Dan Carpenter wrote:
> The "&fs_info->dev_replace.rwsem" and "&dev_replace->rwsem" refer to
> the same lock but Smatch is not clever enough to figure that out so it
> leads to static checker warnings.  It's better to use it consistently
> anyway.

Both reasons, smatch and code consitency are fine, thanks.

Reviewed-by: David Sterba <dsterba@suse.com>
