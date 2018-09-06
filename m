From: David Sterba <dsterba@suse.cz>
Date: Thu, 06 Sep 2018 16:08:27 +0000
Subject: Re: [PATCH] btrfs: remove unused pointer 'tree'
Message-Id: <20180906160827.GE24025@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180828132101.9559-1-colin.king@canonical.com>
In-Reply-To: <20180828132101.9559-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Aug 28, 2018 at 02:21:01PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer 'tree' is being assigned but is never used hence it is
> redundant and can be removed.

For patches removing dead code it's good to do a bit of research what
was the reason for that. In most cases it's a simple leftover after some
other cleanup or rework, ie. harmless, but this needs to be reviewed
anyway and the reference in changelog helps.

In this case it's after my commit 00032d38eaa89c76de7, I'll update the
changelog. And the previous patch removing inode in relink_file_extents
was udpated too.
> 
> Cleans up clang warning:
> warning: variable 'tree' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: David Sterba <dsterba@suse.com>
