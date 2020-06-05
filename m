From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Jun 2020 09:13:24 +0000
Subject: Re: [PATCH v2] crypto: hisilicon - allow smaller reads in debugfs
Message-Id: <20200605091324.GR30374@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200602135409.GA59808@mwanda>
 <3e9b204f-ef53-31c5-afcd-e0791224c2b0@huawei.com>
In-Reply-To: <3e9b204f-ef53-31c5-afcd-e0791224c2b0@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shukun Tan <tanshukun1@huawei.com>
Cc: b6da310b-e633-9f74-f7af-7791d803aaf5@huawei.com, Zhou Wang <wangzhou1@hisilicon.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jun 05, 2020 at 09:19:53AM +0800, Shukun Tan wrote:
> Hi Dan,
> 
> On 2020/6/2 21:54, Dan Carpenter wrote:
> > Originally this code rejected any read less than 256 bytes.  There
> > is no need for this artificial limit.  We should just use the normal
> > helper functions to read a string from the kernel.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2: Use simple_read_from_buffer().  The v1 was slightly half arsed
> > because I left the original check for:
> > 
> > 	if (*pos)
> > 		return 0;
> > 
> > So it could result in partial reads.  The new code means that if you
> > want to read the buffer one byte at a time, that's fine or if you want
> > to read it in one 256 byte chunk that's also fine.  Plus it deletes 21
> > lines of code and is a lot cleaner.
> > 
> 
> In fact, In our original design, we do not hope the user do the partial reads.
> Thank you for your work, but I still insist on adding this limit.

This not how POSIX filesystems work...  :(  Last time you said that this
literally breaks cat.

This doesn't break anything if the user chooses not to read a single
byte at a time.  That's obviously a crazy way to read a file.  It just
allows them to if they want.  Or if they want to read 256 bytes at a
time then that also works.  My patch makes *everything* work.

regards,
dan carpenter
