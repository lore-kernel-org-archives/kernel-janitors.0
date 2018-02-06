From: David Sterba <dsterba@suse.cz>
Date: Tue, 06 Feb 2018 15:23:07 +0000
Subject: Re: [PATCH][btrfs-next] Btrfs: extent map selftest: add missing void parameter to btrfs_test_extent_
Message-Id: <20180206152307.GC31890@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180108230632.8101-1-colin.king@canonical.com>
In-Reply-To: <20180108230632.8101-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, Liu Bo <bo.li.liu@oracle.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jan 08, 2018 at 11:06:32PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Add a missing void parameter to function btrfs_test_extent_map, fixes
> sparse warning:
> 
> warning: non-ANSI function declaration of function 'btrfs_test_extent_map'
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Added to next, thanks.
