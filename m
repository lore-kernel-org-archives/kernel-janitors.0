From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 May 2019 15:03:11 +0000
Subject: Re: [PATCH] orangefs: remove redundant assignment to variable buffer_index
Message-Id: <20190521150311.GL31203@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190511132700.4862-1-colin.king@canonical.com>
 <CAOg9mSQt42NQu-3nwZOCGOPx45y7G8aaiDaVe4SwotGnD9iY1A@mail.gmail.com>
In-Reply-To: <CAOg9mSQt42NQu-3nwZOCGOPx45y7G8aaiDaVe4SwotGnD9iY1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marshall <hubcap@omnibond.com>
Cc: Colin King <colin.king@canonical.com>, Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, May 16, 2019 at 12:06:31PM -0400, Mike Marshall wrote:
> Hi Colin...
> 
> Thanks for the patch. Before I initialized buffer_index, Dan Williams sent
> in a warning that a particular error path could try to use ibuffer_index
> uninitialized. I could induce the problem he described with one
> of the xfstests resulting in a crashed kernel. I will try to refactor
> the code to fix the problem some other way than initializing
> buffer_index in the declaration.
> 

The only explanation I can think of is that you guys are discussing
different code.  :P

regards,
dan carpenter
