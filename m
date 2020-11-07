From: "Theodore Y. Ts'o" <tytso@mit.edu>
Date: Sat, 07 Nov 2020 03:23:30 +0000
Subject: Re: [PATCH] ext4: silence an uninitialized variable warning
Message-Id: <20201107032330.GN1750809@mit.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201030114620.GB3251003@mwanda>
In-Reply-To: <20201030114620.GB3251003@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Harshad Shirwadkar <harshadshirwadkar@gmail.com>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Oct 30, 2020 at 02:46:20PM +0300, Dan Carpenter wrote:
> Smatch complains that "i" can be uninitialized if we don't enter the
> loop.  I don't know if it's possible but we may as well silence this
> warning.

Thanks, applied.

I changed the patch so that i gets initialized to sb->s_blocksize
instead of 0.  The only way the for loop could be skipped entirely,
leaving i initialized, is if the in-memory data structures, in
particular the bh->b_data for the on-disk superblock has gotten
corrupted enough that calculated value of group is >= to
ext4_get_groups_count(sb).  In that case, we want to exit immediately
without allocating a block, and if i is left to sb->s_blocksize, that
will cause the function to bail out right after the skipped for loop.

     	       		   	    - Ted
