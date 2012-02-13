From: Ted Ts'o <tytso@mit.edu>
Date: Mon, 13 Feb 2012 23:41:47 +0000
Subject: Re: [patch] ext4: using PTR_ERR() on the wrong variable in ext4_ext_migrate()
Message-Id: <20120213234147.GJ21641@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120126061406.GB15856@elgon.mountain>
In-Reply-To: <20120126061406.GB15856@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jan 26, 2012 at 09:14:06AM +0300, Dan Carpenter wrote:
> "inode" is a valid pointer here.  "tmp_inode" was intended.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.

					- Ted
