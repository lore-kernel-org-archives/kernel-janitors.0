From: Theodore Ts'o <tytso@mit.edu>
Date: Thu, 11 Jan 2018 19:18:10 +0000
Subject: Re: [PATCH] ext4: fix incorrect indentation of if statement
Message-Id: <20180111191810.GF19241@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171129142059.21898-1-colin.king@canonical.com>
 <20180104154018.GB2170@quack2.suse.cz>
In-Reply-To: <20180104154018.GB2170@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Colin King <colin.king@canonical.com>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jan 04, 2018 at 04:40:18PM +0100, Jan Kara wrote:
> On Wed 29-11-17 14:20:59, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The indentation is incorrect and spaces need replacing with a tab
> > on the if statement.
> > 
> > Cleans up smatch warning:
> > fs/ext4/namei.c:3220 ext4_link() warn: inconsistent indenting
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> This seems to fall through cracks. The patch looks good. You can add:
> 
> Reviewed-by: Jan Kara <jack@suse.cz>

Thanks, applied.  There was actually another whitespace issue on the
following line, which I've fixed up and merged into this patch.

	  	      	   	    	- Ted
