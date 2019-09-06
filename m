From: "Theodore Y. Ts'o" <tytso@mit.edu>
Date: Fri, 06 Sep 2019 15:31:47 +0000
Subject: Re: [PATCH] unicode: make array 'token' static const, makes object smaller
Message-Id: <20190906153147.GA2819@mit.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190906135807.23152-1-colin.king@canonical.com>
In-Reply-To: <20190906135807.23152-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Gabriel Krisman Bertazi <krisman@collabora.com>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Sep 06, 2019 at 02:58:07PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array 'token' on the stack but instead make it
> static const. Makes the object code smaller by 234 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>    5371	    272	      0	   5643	   160b	fs/unicode/utf8-core.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>    5041	    368	      0	   5409	   1521	fs/unicode/utf8-core.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Nice, thanks!

Reviewed-by: Theodore Ts'o <tytso@mit.edu>

						- Ted
