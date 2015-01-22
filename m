From: Johannes Weiner <hannes@cmpxchg.org>
Date: Thu, 22 Jan 2015 15:25:35 +0000
Subject: Re: [patch] mm: memcontrol: uninitialized "ret" variables
Message-Id: <20150122152535.GB27368@phnom.home.cmpxchg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150122133044.GA23668@mwanda>
In-Reply-To: <20150122133044.GA23668@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Michal Hocko <mhocko@suse.cz>, cgroups@vger.kernel.org, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Thu, Jan 22, 2015 at 04:30:44PM +0300, Dan Carpenter wrote:
> We recently re-arranged the code in these functions and now static
> checkers complain that "ret" is uninitialized.  Oddly enough GCC is fine
> with this code.
> 
> Fixes: d1ebc463cf89 ('mm: page_counter: pull "-1" handling out of page_counter_memparse()')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

This code was again re-arranged in -mm, and that

  ret = page_counter_memparse()

is now happening unconditionally, so I think it should be fine.  The
latest mmots snapshot (mmots-2015-01-21-16-38) has it.

Thanks!
