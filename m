From: Theodore Ts'o <tytso@mit.edu>
Date: Sat, 03 Dec 2016 21:47:58 +0000
Subject: Re: ext4: remove another test in ext4_alloc_file_blocks()
Message-Id: <20161203214758.4jo2dhgjm5ujqzhw@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012060002.GA12778@mwanda>
 <20161021095435.GC8271@quack2.suse.cz>
In-Reply-To: <20161021095435.GC8271@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Fabian Frederick <fabf@skynet.be>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Oct 21, 2016 at 11:54:35AM +0200, Jan Kara wrote:
> On Wed 12-10-16 09:00:02, Dan Carpenter wrote:
> > Before commit c3fe493ccdb1 ('ext4: remove unneeded test in
> > ext4_alloc_file_blocks()') then it was possible for "depth" to be -1
> > but now, it's not possible that it is negative.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Looks good. You can add:
> 
> Reviewed-by: Jan Kara <jack@suse.cz>

Applied, thanks.

					- Ted
