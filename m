From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 30 Dec 2007 21:49:34 +0000
Subject: Re: [RFC][PATCH] byteorder: introduce le32_add_cpu & friends to
Message-Id: <20071230214857.GA14177@joi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071230190619.GA13757@joi> <20071230191825.GA6447@infradead.org>
In-Reply-To: <20071230191825.GA6447@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

On Sun, Dec 30, 2007 at 07:18:25PM +0000, Christoph Hellwig wrote:
> On Sun, Dec 30, 2007 at 08:06:34PM +0100, Marcin Slusarz wrote:
> > There are many places where these functions would be useful.
> > (just look at: grep -r 'cpu_to_[ble12346]*([ble12346]*_to_cpu.*[-+]' linux-src/)
> > What do you think?
> > 
> > ps: this patch depends on http://lkml.org/lkml/2007/12/25/35
> > --
> > 
> > add inline functions which add native byte order variable to
> > little/big endian variable to core header and as an example
> > convert ext3 to use them
> 
> Various places already have this as be*_add / le*_add, so it might be
> more useful to keep those names already in use.

I found it in XFS only. Did I miss something?
be32_add is shorter than be32_add_cpu but I think it's not clear
whether second parameter is in native byte order or not.

Marcin
