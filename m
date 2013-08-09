From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 09 Aug 2013 09:36:37 +0000
Subject: Re: rfc: ARRAY_AND_SIZE
Message-Id: <20130809093637.GI5502@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5204A345.5060605@bfs.de>
In-Reply-To: <5204A345.5060605@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 09, 2013 at 11:23:06AM +0200, Julia Lawall wrote:

> Actually, it is used 226 times as function arguments, in 77 files.  It is
> used 39 times in a structure declaration.

Ah...  I was using cscope and so I missed ARM uses that weren't in
my config.

That's ugly, yes.  But I still think the maintainers aren't going to
appreciate patches for this since they did it deliberately.

regards,
dan carpenter

