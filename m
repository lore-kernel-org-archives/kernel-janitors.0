From: David Sterba <dsterba@suse.cz>
Date: Thu, 29 Oct 2020 20:51:50 +0000
Subject: Re: [PATCH] btrfs: clean up NULL checks in qgroup_unreserve_range()
Message-Id: <20201029205150.GW6756@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023112633.GE282278@mwanda>
In-Reply-To: <20201023112633.GE282278@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Mason <clm@fb.com>, Qu Wenruo <wqu@suse.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Oct 23, 2020 at 02:26:33PM +0300, Dan Carpenter wrote:
> Smatch complains that this code dereferences "entry" before checking
> whether it's NULL on the next line.  Fortunately, rb_entry() will never
> return NULL so it doesn't cause a problem.  We can clean up the NULL
> checking a bit to silence the warning and make the code more clear.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Added to misc-next, thanks.
