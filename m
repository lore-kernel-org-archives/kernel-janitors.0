From: Theodore Ts'o <tytso@mit.edu>
Date: Fri, 08 Jan 2016 20:52:28 +0000
Subject: Re: [patch] ext4: checking for NULL instead of IS_ERR
Message-Id: <20160108205228.GE28412@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160106100425.GG23185@mwanda>
In-Reply-To: <20160106100425.GG23185@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Li Xi <pkuelelixi@gmail.com>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 06, 2016 at 01:04:25PM +0300, Dan Carpenter wrote:
> The dqget() function returns error pointers on error, it doesn't return
> NULL.
> 
> Fixes: 76481d7a60a4 ('ext4: add project quota support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for pointing this out.  I've folded this into the commit with
the bug.

					- Ted
