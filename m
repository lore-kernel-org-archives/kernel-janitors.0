From: David Sterba <dsterba@suse.cz>
Date: Mon, 10 Aug 2020 15:06:44 +0000
Subject: Re: [PATCH] btrfs: Fix an error pointer vs NULL check
Message-Id: <20200810150644.GA2026@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200805095147.GB483832@mwanda>
In-Reply-To: <20200805095147.GB483832@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Aug 05, 2020 at 12:51:47PM +0300, Dan Carpenter wrote:
> The btrfs_get_subvol_name_from_objectid() function never
> returns NULL, it returns error pointers.  Update the check
> accordinglingly to prevent an Oops.
> 
> Fixes: ca346708eb17 ("btrfs: don't show full path of bind mounts in subvol=")

Thanks for catching it, the patch is in a development branch and the
commit id is unstable so I'll fold the fixup.
