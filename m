From: Christoph Hellwig <hch@lst.de>
Date: Wed, 11 Feb 2015 13:21:19 +0000
Subject: Re: [patch] nfsd: fix comparison in fh_fsid_match()
Message-Id: <20150211132119.GA10377@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150211130832.GA25573@mwanda>
In-Reply-To: <20150211130832.GA25573@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, Christoph Hellwig <hch@lst.de>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Feb 11, 2015 at 04:08:32PM +0300, Dan Carpenter wrote:
> We're supposed to be testing that the fh_fsid's match but because the
> parenthesis are in the wrong place, then we only check the first
> byte.
> 
> Fixes: 9558f2500a20 ('nfsd: add fh_fsid_match helper')

Thanks, this looks good.  Is there an easy to setup way to check for
these sorts of errors?
