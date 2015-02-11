From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Feb 2015 14:03:19 +0000
Subject: Re: [patch] nfsd: fix comparison in fh_fsid_match()
Message-Id: <20150211140319.GO5206@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150211130832.GA25573@mwanda>
 <20150211132119.GA10377@lst.de>
In-Reply-To: <20150211132119.GA10377@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Feb 11, 2015 at 02:21:19PM +0100, Christoph Hellwig wrote:
> On Wed, Feb 11, 2015 at 04:08:32PM +0300, Dan Carpenter wrote:
> > We're supposed to be testing that the fh_fsid's match but because the
> > parenthesis are in the wrong place, then we only check the first
> > byte.
> > 
> > Fixes: 9558f2500a20 ('nfsd: add fh_fsid_match helper')
> 
> Thanks, this looks good.  Is there an easy to setup way to check for
> these sorts of errors?

This is a Smatch check I wrote a couple years ago but it never found any
bugs until now so I didn't commit it.  I have done.  I'll push it out
later and Fengguang will eventually add it to the zero day tester bot.

regards,
dan carpenter

