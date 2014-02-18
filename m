From: Theodore Ts'o <tytso@mit.edu>
Date: Tue, 18 Feb 2014 01:27:52 +0000
Subject: Re: [patch] jbd2: use after free in jbd2_journal_start_reserved()
Message-Id: <20140218012752.GD26580@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140213111953.GC15549@elgon.mountain>
In-Reply-To: <20140213111953.GC15549@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Feb 13, 2014 at 02:19:53PM +0300, Dan Carpenter wrote:
> If start_this_handle() fails then it leads to a use after free of
> "handle".
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.

						- Ted
