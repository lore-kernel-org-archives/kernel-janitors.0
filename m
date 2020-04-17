From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Fri, 17 Apr 2020 12:25:42 +0000
Subject: Re: [PATCH] RDMA/ocrdma: Fix an off-by-one issue in 'ocrdma_add_stat'
Message-Id: <20200417122542.GC5100@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200328073040.24429-1-christophe.jaillet@wanadoo.fr>
 <20200414183441.GA28870@ziepe.ca>
 <20200416130847.GP1163@kadam>
 <20200416184754.GZ5100@ziepe.ca>
 <20200417112624.GS1163@kadam>
In-Reply-To: <20200417112624.GS1163@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, g@ziepe.ca
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, selvin.xavier@broadcom.com, devesh.sharma@broadcom.com, dledford@redhat.com, leon@kernel.org, colin.king@canonical.com, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Apr 17, 2020 at 02:26:24PM +0300, Dan Carpenter wrote:
> On Thu, Apr 16, 2020 at 03:47:54PM -0300, Jason Gunthorpe wrote:
> > On Thu, Apr 16, 2020 at 04:08:47PM +0300, Dan Carpenter wrote:
> > > On Tue, Apr 14, 2020 at 03:34:41PM -0300, Jason Gunthorpe wrote:
> > > > The memcpy is still kind of silly right? What about this:
> > > > 
> > > > static int ocrdma_add_stat(char *start, char *pcur, char *name, u64 count)
> > > > {
> > > > 	size_t len = (start + OCRDMA_MAX_DBGFS_MEM) - pcur;
> > > > 	int cpy_len;
> > > > 
> > > > 	cpy_len = snprintf(pcur, len, "%s: %llu\n", name, count);
> > > > 	if (cpy_len >= len || cpy_len < 0) {
> > > 
> > > The kernel version of snprintf() doesn't and will never return
> > > negatives.  It would cause a huge security headache if it started
> > > returning negatives.
> > 
> > Begs the question why it returns an int then :)
> 
> People should use "int" as their default type.  "int i;".  It means
> "This is a normal number.  Nothing special about it.  It's not too high.
> It's not defined by hardware requirements."  Other types call attention
> to themselves, but int is the humble datatype.

No, I strongly disagree with this, it is one of my pet peeves to see
'int' being used for data which is known to be only ever be positive
just to save typing 'unsigned'.

Not only is it confusing, but allowing signed values has caused tricky
security bugs, unfortuntely.

Jason
