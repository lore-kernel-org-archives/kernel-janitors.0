From: David Sterba <dsterba@suse.cz>
Date: Mon, 12 Feb 2018 18:22:42 +0000
Subject: Re: [PATCH][btrfs-next] Btrfs: extent map selftest: fix non-ANSI btrfs_test_extent_map declaration
Message-Id: <20180212182242.GP3003@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180208141327.10951-1-colin.king@canonical.com>
In-Reply-To: <20180208141327.10951-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Feb 08, 2018 at 02:13:27PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The function btrfs_test_extent_map requires a void argument to be ANSI C
> compliant and so it matches the prototype in fs/btrfs/tests/btrfs-tests.h
> 
> Cleans up sparse warning:
> fs/btrfs/tests/extent-map-tests.c:346:27: warning: non-ANSI function
> declaration of function 'btrfs_test_extent_map'
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

FYI, the first patch fixing the warning has been added to for-next
already.
