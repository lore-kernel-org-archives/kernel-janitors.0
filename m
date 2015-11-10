From: David Sterba <dsterba@suse.cz>
Date: Tue, 10 Nov 2015 09:43:31 +0000
Subject: Re: [patch] Btrfs: tests: checking for NULL instead of IS_ERR()
Message-Id: <20151110094331.GB6445@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151110091003.GC2934@mwanda>
In-Reply-To: <20151110091003.GC2934@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Nov 10, 2015 at 12:10:03PM +0300, Dan Carpenter wrote:
> btrfs_alloc_dummy_root() return an error pointer on failure, it never
> returns NULL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: David Sterba <dsterba@suse.com>
