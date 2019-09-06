From: Dominique Martinet <asmadeus@codewreck.org>
Date: Fri, 06 Sep 2019 14:01:45 +0000
Subject: Re: [PATCH] 9p: make two arrays static const, makes object smaller
Message-Id: <20190906140145.GA16910@nautica>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190906133812.17196-1-colin.king@canonical.com>
In-Reply-To: <20190906133812.17196-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Eric Van Hensbergen <ericvh@gmail.com>, Latchesar Ionkov <lucho@ionkov.net>, v9fs-developer@lists.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King wrote on Fri, Sep 06, 2019:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the arrays on the stack but instead make them
> static const. Makes the object code smaller by 386 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   17443	   2076	      0	  19519	   4c3f	fs/9p/vfs_inode_dotl.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   16897	   2236	      0	  19133	   4abd	fs/9p/vfs_inode_dotl.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Fine with me, I'll pick it up for the next cycle.

There are a couple of static structs in net/9p that aren't const (but
could be); I guess the static is all that matters here?
(I'll try to go through and make the rest const when I have time
though, no harm there)

Thanks,
-- 
Dominique
