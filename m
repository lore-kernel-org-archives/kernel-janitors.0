From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 13 Aug 2019 13:14:20 +0000
Subject: Re: [PATCH] scsi: sym53c8xx_2: remove redundant assignment to retv
Message-Id: <20190813131420.GS1974@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190809175932.10197-1-colin.king@canonical.com>
 <20190809181733.GQ5482@bombadil.infradead.org>
In-Reply-To: <20190809181733.GQ5482@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@infradead.org>
Cc: Colin King <colin.king@canonical.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Aug 09, 2019 at 11:17:33AM -0700, Matthew Wilcox wrote:
> On Fri, Aug 09, 2019 at 06:59:32PM +0100, Colin King wrote:
> > Variable retv is initialized to a value that is never read and it
> > is re-assigned later. The initialization is redundant and can be
> > removed.
> 
> Acked-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> 
> Seems like a bit of a pointless class of warnings, given that gcc now
> initialises all locals.  But I'm happy for James or Martin to pick it up.

GCC doesn't initialize all locals.  Just some depending on the
optimization level.  It's related to a bug that's several years old.

This warning does find some bugs.  The common one is where people forget
to check the return.

	ret = something();
	// blank line here indicates that ret is never checked again.

regards,
dan carpenter
