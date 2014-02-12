From: Theodore Ts'o <tytso@mit.edu>
Date: Wed, 12 Feb 2014 17:25:22 +0000
Subject: Re: [patch] ext4: remove an unneeded check in mext_page_mkuptodate()
Message-Id: <20140212172522.GG14520@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140206124549.GA16998@elgon.mountain>
In-Reply-To: <20140206124549.GA16998@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Feb 06, 2014 at 03:45:50PM +0300, Dan Carpenter wrote:
> "err" is zero here, there is no need to check again.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.

					- Ted
