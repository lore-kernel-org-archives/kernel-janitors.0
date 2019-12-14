From: "Theodore Y. Ts'o" <tytso@mit.edu>
Date: Sat, 14 Dec 2019 22:32:23 +0000
Subject: Re: [PATCH] ext4: unlock on error in ext4_expand_extra_isize()
Message-Id: <20191214223223.GA448096@mit.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191213113237.GF15474@quack2.suse.cz>
 <20191213185010.6k7yl2tck3wlsdkt@kili.mountain>
In-Reply-To: <20191213185010.6k7yl2tck3wlsdkt@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Miao Xie <miaoxie@huawei.com>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Dec 13, 2019 at 09:50:11PM +0300, Dan Carpenter wrote:
> We need to unlock the xattr before returning on this error path.
> 
> Fixes: c03b45b853f5 ("ext4, project: expand inode extra size if possible")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.

					- Ted
