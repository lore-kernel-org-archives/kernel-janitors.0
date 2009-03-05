From: Christoph Hellwig <hch@infradead.org>
Date: Thu, 05 Mar 2009 21:29:20 +0000
Subject: Re: [PATCH 3/3 v2] xfs: include header files for prototypes
Message-Id: <20090305212920.GA1883@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090304183136.525.13769.stgit@f10box.hanneseder.net>
	<20090304183418.525.22262.stgit@f10box.hanneseder.net>
	<20090305133917.GC14854@lst.de>
	<20090305141912.22775.64010.stgit@f10box.hanneseder.net>
In-Reply-To: <20090305141912.22775.64010.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: kernel-janitors@vger.kernel.org, xfs@oss.sgi.com, Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org

On Thu, Mar 05, 2009 at 03:20:25PM +0100, Hannes Eder wrote:
> I still treat this as a Acked-by: ... Ok?

Should be a review, as far as you can review these sort of patches..

> hm. but that way it is still included before xfs_mount.h.

Sure, but the point is entirely the comment which describes the block
of includes below.
