From: Ted Ts'o <tytso@mit.edu>
Date: Mon, 31 Oct 2011 17:53:36 +0000
Subject: Re: [patch 2/2] jbd2: use gfp_t instead of int
Message-Id: <20111031175336.GG16825@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110826092036.GN5975@shale.localdomain>
In-Reply-To: <20110826092036.GN5975@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "open list:JOURNALLING LAYER..." <linux-ext4@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Aug 26, 2011 at 12:20:37PM +0300, Dan Carpenter wrote:
> This silences some Sparse warnings:
> fs/jbd2/transaction.c:135:69: warning: incorrect type in argument 2 (different base types)
> fs/jbd2/transaction.c:135:69:    expected restricted gfp_t [usertype] flags
> fs/jbd2/transaction.c:135:69:    got int [signed] gfp_mask
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

This has been merged into the ext4 tree (a while ago, actually, but it
looks like I forgot to send an e-mail ack).

					- Ted
