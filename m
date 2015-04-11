From: Theodore Ts'o <tytso@mit.edu>
Date: Sat, 11 Apr 2015 11:55:44 +0000
Subject: Re: [patch] ext4 crypto: fix an error code in ext4_init_crypto()
Message-Id: <20150411115544.GB6540@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150409090308.GB17605@mwanda>
In-Reply-To: <20150409090308.GB17605@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Michael Halcrow <mhalcrow@google.com>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Apr 09, 2015 at 12:03:08PM +0300, Dan Carpenter wrote:
> The callers don't care about the error so it doesn't make a difference,
> but static checkers complain so let's return an error code here.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for pointing this out!  I will merge this with the next version
of the ext4 crypto patches.

						- Ted
