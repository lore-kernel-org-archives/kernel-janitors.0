From: David Sterba <dsterba@suse.cz>
Date: Mon, 05 Aug 2019 12:36:47 +0000
Subject: Re: [PATCH][btrfs-next] btrfs: fix spelling mistake "aliged" -> "aligned"
Message-Id: <20190805123647.GZ28208@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190805104732.26738-1-colin.king@canonical.com>
In-Reply-To: <20190805104732.26738-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Aug 05, 2019 at 11:47:32AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in an extent_err error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, I've folded the fix to the patch ("btrfs: tree-checker: Add
EXTENT_ITEM and METADATA_ITEM check").
