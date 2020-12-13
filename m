From: "Theodore Y. Ts'o" <tytso@mit.edu>
Date: Sun, 13 Dec 2020 16:25:25 +0000
Subject: Re: [PATCH] ext4: Fix an IS_ERR() vs NULL check
Message-Id: <20201213162525.GA835709@mit.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023112232.GB282278@mwanda>
 <20201210160419.GA31725@quack2.suse.cz>
In-Reply-To: <20201210160419.GA31725@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Harshad Shirwadkar <harshadshirwadkar@gmail.com>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Dec 10, 2020 at 05:04:19PM +0100, Jan Kara wrote:
> On Fri 23-10-20 14:22:32, Dan Carpenter wrote:
> > The ext4_find_extent() function never returns NULL, it returns error
> > pointers.
> > 
> > Fixes: 44059e503b03 ("ext4: fast commit recovery path")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> I think this fix has fallen through the cracks? It looks good to me so feel
> free to add:
> 
> Reviewed-by: Jan Kara <jack@suse.cz>

This had indeed slipped through the cracks.  Thanks for pointing it
out; I've applied it.

					- Ted
