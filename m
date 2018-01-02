From: Jan Kara <jack@suse.cz>
Date: Tue, 02 Jan 2018 13:42:30 +0000
Subject: Re: [PATCH 04/12] ext2: drop unneeded newline
Message-Id: <20180102134230.GA30307@quack2.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
 <1514386305-7402-5-git-send-email-Julia.Lawall@lip6.fr>
 <20171228043042.GB30269@thunk.org>
In-Reply-To: <20171228043042.GB30269@thunk.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Jan Kara <jack@suse.com>, kernel-janitors@vger.kernel.org, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed 27-12-17 23:30:42, Ted Tso wrote:
> On Wed, Dec 27, 2017 at 03:51:37PM +0100, Julia Lawall wrote:
> > ext2_msg prints a newline at the end of the message string, so the message
> > string does not need to include a newline explicitly.  Done using
> > Coccinelle.
> > 
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>

Thanks. I've picked up the patch to my tree.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
