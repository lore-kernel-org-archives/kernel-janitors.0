From: Theodore Ts'o <tytso@mit.edu>
Date: Thu, 06 Dec 2012 17:23:08 +0000
Subject: Re: [patch] ext4: unneeded variable in ext4_try_add_inline_entry()
Message-Id: <20121206172308.GD30273@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121205080836.GA10259@elgon.mountain>
In-Reply-To: <20121205080836.GA10259@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org, Tao Ma <boyu.mt@taobao.com>

On Wed, Dec 05, 2012 at 11:08:37AM +0300, Dan Carpenter wrote:
> We never actually use "backup_buf" so I have removed it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I've merged this into the inline data patches; thanks for reporting it!

     	    	      	  	      - Ted
