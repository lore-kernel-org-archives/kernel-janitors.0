From: Christoph Hellwig <hch@lst.de>
Date: Thu, 05 Mar 2009 13:37:39 +0000
Subject: Re: [PATCH 1/3] xfs: move declaration to header file
Message-Id: <20090305133739.GA14854@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090304183136.525.13769.stgit@f10box.hanneseder.net> <20090304183331.525.4491.stgit@f10box.hanneseder.net>
In-Reply-To: <20090304183331.525.4491.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: Felix Blyakher <felixb@sgi.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

On Wed, Mar 04, 2009 at 07:33:48PM +0100, Hannes Eder wrote:
> Fix this sparse warning:
>   fs/xfs/xfs_da_btree.c:1550:26: warning: symbol 'xfs_default_nameops' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Looks good to me.

And for future patches please always send them to the mailinglist
(xfs@oss.sgi.com)

