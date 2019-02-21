From: "Theodore Y. Ts'o" <tytso@mit.edu>
Date: Thu, 21 Feb 2019 16:18:20 +0000
Subject: Re: [PATCH] ext4: Fix some error pointer dereferences
Message-Id: <20190221161820.GA10245@mit.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190103113811.GA13543@kadam>
In-Reply-To: <20190103113811.GA13543@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jan 03, 2019 at 02:38:11PM +0300, Dan Carpenter wrote:
> We can't pass error pointers to brelse().
> 
> Fixes: fb265c9cb49e ("ext4: add ext4_sb_bread() to disambiguate ENOMEM cases")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

						- Ted
