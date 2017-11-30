From: David Sterba <dsterba@suse.cz>
Date: Thu, 30 Nov 2017 15:50:54 +0000
Subject: Re: [PATCH] btrfs: make function update_share_count static
Message-Id: <20171130155054.GL3553@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171130121447.5118-1-colin.king@canonical.com>
In-Reply-To: <20171130121447.5118-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 30, 2017 at 12:14:47PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The function update_share_count is local to the source and does
> not need to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> fs/btrfs/backref.c:219:6: warning: symbol 'update_share_count' was not
> declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: David Sterba <dsterba@suse.com>
