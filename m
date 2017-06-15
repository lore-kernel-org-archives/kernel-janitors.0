From: David Rientjes <rientjes@google.com>
Date: Thu, 15 Jun 2017 01:49:08 +0000
Subject: Re: [PATCH] mm, vmpressure: free the same pointer we allocated
Message-Id: <alpine.DEB.2.10.1706141847460.77174@chino.kir.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170613191820.GA20003@elgon.mountain>
In-Reply-To: <20170613191820.GA20003@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, Vinayak Menon <vinmenon@codeaurora.org>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On Tue, 13 Jun 2017, Dan Carpenter wrote:

> We keep incrementing "spec" as we parse the args so we end up calling
> kfree() on a modified of spec.  It probably works or this would have
> been caught in testing, but it looks weird.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: David Rientjes <rientjes@google.com>
