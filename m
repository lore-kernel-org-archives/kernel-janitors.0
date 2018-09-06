From: David Sterba <dsterba@suse.cz>
Date: Thu, 06 Sep 2018 15:59:51 +0000
Subject: Re: [PATCH] btrfs: remove unused pointer inode
Message-Id: <20180906155951.GD24025@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180828104521.5167-1-colin.king@canonical.com>
In-Reply-To: <20180828104521.5167-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Aug 28, 2018 at 11:45:21AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer inode is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> variable ‘inode’ set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: David Sterba <dsterba@suse.com>
