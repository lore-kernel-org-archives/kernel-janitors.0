From: tytso@mit.edu
Date: Wed, 23 Dec 2009 12:53:34 +0000
Subject: Re: [PATCH 2/2] fs/ext4: Eliminate double free
Message-Id: <20091223125334.GE21594@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912201806530.26912@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912201806530.26912@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Andreas Dilger <adilger@sun.com>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Dec 20, 2009 at 06:07:10PM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> b_entry_name and buffer are initially NULL, are initialized within a loop
> to the result of calling kmalloc, and are freed at the bottom of this loop.
> The loop contains gotos to cleanup, which also frees b_entry_name and
> buffer.  Some of these gotos are before the reinitializations of
> b_entry_name and buffer.  To maintain the invariant that b_entry_name and
> buffer are NULL at the top of the loop, and thus acceptable arguments to
> kfree, these variables are now set to NULL after the kfrees.
> 
> This seems to be the simplest solution.  A more complicated solution
> would be to introduce more labels in the error handling code at the end of
> the function.

Thanks, added to the ext4 patch queue.

						- Ted
