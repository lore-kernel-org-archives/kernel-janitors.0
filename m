From: Vladimir Davydov <vdavydov.dev@gmail.com>
Date: Tue, 18 Jun 2019 20:02:51 +0000
Subject: Re: [PATCH] mm: idle-page: fix oops because end_pfn is larger than max_pfn
Message-Id: <20190618200251.hd2uk6qzyvsy55py@esperanza>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190618124352.28307-1-colin.king@canonical.com>
 <20190618124502.7b9c32a00a54f0c618a12ca4@linux-foundation.org>
In-Reply-To: <20190618124502.7b9c32a00a54f0c618a12ca4@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Colin King <colin.king@canonical.com>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Mel Gorman <mgorman@techsingularity.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jun 18, 2019 at 12:45:02PM -0700, Andrew Morton wrote:
> On Tue, 18 Jun 2019 13:43:52 +0100 Colin King <colin.king@canonical.com> wrote:
> 
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently the calcuation of end_pfn can round up the pfn number to
> > more than the actual maximum number of pfns, causing an Oops. Fix
> > this by ensuring end_pfn is never more than max_pfn.
> > 
> > This can be easily triggered when on systems where the end_pfn gets
> > rounded up to more than max_pfn using the idle-page stress-ng
> > stress test:
> > 
> 
> cc Vladimir.  This seems rather obvious - I'm wondering if the code was
> that way for some subtle reason?

No subtle reason at all - just a bug. The patch looks good to me,

Acked-by: Vladimir Davydov <vdavydov.dev@gmail.com>
