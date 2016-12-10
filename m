From: Theodore Ts'o <tytso@mit.edu>
Date: Sat, 10 Dec 2016 14:58:34 +0000
Subject: Re: [patch] ext4: return -ENOMEM instead of success
Message-Id: <20161210145834.i6uizxma4625kb2p@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161207112106.GB5507@elgon.mountain>
In-Reply-To: <20161207112106.GB5507@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tao Ma <boyu.mt@taobao.com>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Dec 07, 2016 at 02:21:06PM +0300, Dan Carpenter wrote:
> We should set the error code if kzalloc() fails.
> 
> Fixes: 67cf5b09a46f ("ext4: add the basic function for inline data support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.

					- Ted
