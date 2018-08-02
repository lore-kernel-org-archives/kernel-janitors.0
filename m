From: David Sterba <dsterba@suse.cz>
Date: Thu, 02 Aug 2018 13:34:45 +0000
Subject: Re: [PATCH] btrfs: dereferencing error pointer in btrfs_quota_enable()
Message-Id: <20180802133445.GN3218@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180802084428.k2uemow7k6j3us47@kili.mountain>
In-Reply-To: <20180802084428.k2uemow7k6j3us47@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Mason <clm@fb.com>, Nikolay Borisov <nborisov@suse.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 02, 2018 at 11:44:29AM +0300, Dan Carpenter wrote:
> The error handling in "goto out;" expects that if "trans" is non-NULL
> that means it's valid.  Unfortunately it could also be an error pointer.
> 
> Fixes: c9a6fe84fe43 ("btrfs: qgroups: Move transaction management inside btrfs_quota_enable/disable")

Thanks, folded to the patch as it's still in the development branch.
