From: Ted Ts'o <tytso@mit.edu>
Date: Mon, 13 Feb 2012 23:39:17 +0000
Subject: Re: [patch] ext4: remove an unneeded NULL check
Message-Id: <20120213233917.GI21641@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120124084109.GC29097@elgon.mountain>
In-Reply-To: <20120124084109.GC29097@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jan 24, 2012 at 11:41:09AM +0300, Dan Carpenter wrote:
> We dereference "bh" unconditionally a couple lines down to find
> "by->b_size".  This function is never called with a NULL "bh" so I have
> removed the check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.

					- Ted
