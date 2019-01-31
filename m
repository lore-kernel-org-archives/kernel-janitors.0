From: Daniel Jordan <daniel.m.jordan@oracle.com>
Date: Thu, 31 Jan 2019 01:55:57 +0000
Subject: Re: [PATCH] mm, swap: bounds check swap_info accesses to avoid NULL derefs
Message-Id: <20190131015557.lxxr2m47bsylzc3q@ca-dmjordan1.us.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190114222529.43zay6r242ipw5jb@ca-dmjordan1.us.oracle.com>
 <20190115002305.15402-1-daniel.m.jordan@oracle.com>
 <20190130072846.GA2010@kadam>
In-Reply-To: <20190130072846.GA2010@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Jordan <daniel.m.jordan@oracle.com>, akpm@linux-foundation.org, andrea.parri@amarulasolutions.com, shli@kernel.org, ying.huang@intel.com, dave.hansen@linux.intel.com, sfr@canb.auug.org.au, osandov@fb.com, tj@kernel.org, ak@linux.intel.com, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, paulmck@linux.ibm.com, stern@rowland.harvard.edu, peterz@infradead.org, will.deacon@arm.com

On Wed, Jan 30, 2019 at 10:28:46AM +0300, Dan Carpenter wrote:
> On Mon, Jan 14, 2019 at 07:23:05PM -0500, Daniel Jordan wrote:
> > Probably no need for stable, this is all theoretical.
> 
> The NULL dereference part is not theoretical.  It require CAP_SYS_ADMIN
> so it's not a huge deal, but you could trigger it from snapshot_ioctl()
> with SNAPSHOT_ALLOC_SWAP_PAGE.

Ok, I'll amend the changelog for v2.
