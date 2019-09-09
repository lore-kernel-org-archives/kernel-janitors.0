From: Gabriel Krisman Bertazi <krisman@collabora.com>
Date: Mon, 09 Sep 2019 14:21:53 +0000
Subject: Re: [PATCH] unicode: make array 'token' static const, makes object smaller
Message-Id: <855zm1h7ni.fsf@collabora.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190906135807.23152-1-colin.king@canonical.com>
In-Reply-To: <20190906135807.23152-1-colin.king@canonical.com> (Colin King's
        message of "Fri, 6 Sep 2019 14:58:07 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

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

Thanks, I will get this queued up.

-- 
Gabriel Krisman Bertazi
