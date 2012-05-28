From: Ted Ts'o <tytso@mit.edu>
Date: Mon, 28 May 2012 15:01:43 +0000
Subject: Re: [patch v2] ext4: potential NULL dereference on error
Message-Id: <20120528150143.GG19152@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120514222535.GW5353@quack.suse.cz>
 <20120515084640.GB30265@elgon.mountain>
In-Reply-To: <20120515084640.GB30265@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jan Kara <jack@suse.cz>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, May 15, 2012 at 11:46:40AM +0300, Dan Carpenter wrote:
> The ext4_get_group_desc() function returns NULL on error, and
> ext4_free_inodes_count() function dereferences it without checking.
> There is a check on the next line, but it's too late.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.

					- Ted
