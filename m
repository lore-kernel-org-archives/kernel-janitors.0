From: Theodore Ts'o <tytso@mit.edu>
Date: Fri, 08 Jan 2016 20:36:26 +0000
Subject: Re: [patch] ext4 crypto: unlock on error in ext4_set_encryption_metadata()
Message-Id: <20160108203626.GD28412@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160105095719.GF23619@mwanda>
In-Reply-To: <20160105095719.GF23619@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jan 05, 2016 at 12:57:19PM +0300, Dan Carpenter wrote:
> There is a missing unlock if ext4_journal_start() fails.
> 
> Fixes: 374431bae296 ('ext4 crypto: add ioctls to allow backup of encryption metadata')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for pointing this out!  I've fixed this by folded this into the
appropriate commit.

       	   	    	 	     	    - Ted
