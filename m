From: Christoph Hellwig <hch@lst.de>
Date: Thu, 05 Mar 2009 13:38:28 +0000
Subject: Re: [PATCH 2/3] xfs: make symbols static
Message-Id: <20090305133828.GB14854@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090304183136.525.13769.stgit@f10box.hanneseder.net> <20090304183356.525.64082.stgit@f10box.hanneseder.net>
In-Reply-To: <20090304183356.525.64082.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: Felix Blyakher <felixb@sgi.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

On Wed, Mar 04, 2009 at 07:34:10PM +0100, Hannes Eder wrote:
> Instead of the keyword 'static' the macro 'STATIC' is used, so the
> symbols are still global with CONFIG_XFS_DEBUG.

Looks good.

