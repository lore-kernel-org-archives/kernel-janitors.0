From: David Sterba <dsterba@suse.cz>
Date: Mon, 27 Apr 2020 15:18:05 +0000
Subject: Re: [PATCH][next] btrfs: fix check for memory allocation failure of ret->path
Message-Id: <20200427151805.GC18421@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200421124703.149466-1-colin.king@canonical.com>
In-Reply-To: <20200421124703.149466-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Johannes Thumshirn <johannes.thumshirn@wdc.com>, Qu Wenruo <wqu@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 21, 2020 at 01:47:03PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the memory allocation failure check for ret->path is checking
> that ret is null rather than ret->path.  Fix this by checking ret->path
> instead.
> 
> Addresses-Coverity: ("Dereference null return")
> Fixes: bd8bdc532152 ("btrfs: backref: introduce the skeleton of btrfs_backref_iter")

As this is still in development branch, fixup folded in. Thanks.
