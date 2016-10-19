From: David Sterba <dsterba@suse.cz>
Date: Wed, 19 Oct 2016 14:05:42 +0000
Subject: Re: [patch] Btrfs: remove some no-op casts
Message-Id: <20161019140542.GQ11398@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012063924.GB13780@mwanda>
In-Reply-To: <20161012063924.GB13780@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Mason <clm@fb.com>, Omar Sandoval <osandov@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 12, 2016 at 11:33:21AM +0300, Dan Carpenter wrote:
> We cast 0 to a u8 but then because of type promotion, it's immediately
> cast to int back to int before we do a bitwise negate.  The cast doesn't
> matter in this case, the code works as intended.  It causes a static
> checker warning though so let's remove it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applies to the free space tree fixes that are now in master.

Reviewed-by: David Sterba <dsterba@suse.com>
