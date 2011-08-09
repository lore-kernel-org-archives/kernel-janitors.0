From: Jesper Juhl <jj@chaosbits.net>
Date: Tue, 09 Aug 2011 12:36:03 +0000
Subject: Re: [PATCH] drivers/gpu/vga/vgaarb.c: add missing kfree
Message-Id: <alpine.LNX.2.00.1108091434560.17636@swampdragon.chaosbits.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312892348-22615-1-git-send-email-julia@diku.dk>
In-Reply-To: <1312892348-22615-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Dave Airlie <airlied@redhat.com>, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rakib Mullick <rakib.mullick@gmail.com>, Alex Deucher <alexdeucher@gmail.com>, Daniel J Blueman <daniel.blueman@gmail.com>, linux-kernel@vger.kernel.org

On Tue, 9 Aug 2011, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> kbuf is a buffer that is local to this function, so all of the error paths
> leaving the function should release it.
> 

I already posted a (slightly different) patch for this : 
https://lkml.org/lkml/2011/8/1/329

Nobody has picked it up yet though :-/

Well, now those responsible have two patches to chose from :-)

-- 
Jesper Juhl <jj@chaosbits.net>       http://www.chaosbits.net/
Don't top-post http://www.catb.org/jargon/html/T/top-post.html
Plain text mails only, please.

