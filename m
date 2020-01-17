From: David Sterba <dsterba@suse.cz>
Date: Fri, 17 Jan 2020 13:55:32 +0000
Subject: Re: [PATCH] btrfs: tests: Fix an NULL vs IS_ERR() test
Message-Id: <20200117135532.GE3929@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200117053432.k46ftoqf67dezauh@kili.mountain>
In-Reply-To: <20200117053432.k46ftoqf67dezauh@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Mason <clm@fb.com>, Nikolay Borisov <nborisov@suse.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 17, 2020 at 08:34:32AM +0300, Dan Carpenter wrote:
> The btrfs_alloc_dummy_device() function never returns NULL, it returns
> error pointers.
> 
> Fixes: 5d9a4f871168 ("btrfs: Add self-tests for btrfs_rmap_block")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, folded to the original patch.
