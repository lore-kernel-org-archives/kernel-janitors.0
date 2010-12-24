From: "Ted Ts'o" <tytso@mit.edu>
Date: Fri, 24 Dec 2010 09:57:22 +0000
Subject: Re: [patch] ext4: testing the wrong variable in ext4_init_pageio()
Message-Id: <20101224095722.GH12763@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101223190911.GM1936@bicker>
In-Reply-To: <20101223190911.GM1936@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Dec 23, 2010 at 10:09:11PM +0300, Dan Carpenter wrote:
> This is a copy and paste error.  The intent was to check
> "io_page_cachep".  We tested "io_page_cachep" earlier.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Thanks, added to the ext4 patch queue.

					- Ted
