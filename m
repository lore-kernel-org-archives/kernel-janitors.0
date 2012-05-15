From: David Teigland <teigland@redhat.com>
Date: Tue, 15 May 2012 15:40:39 +0000
Subject: Re: [patch] dlm: NULL dereference on failure in kmem_cache_create()
Message-Id: <20120515154039.GA2746@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120515085812.GF30265@elgon.mountain>
In-Reply-To: <20120515085812.GF30265@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, May 15, 2012 at 11:58:12AM +0300, Dan Carpenter wrote:
> We aren't allowed to pass NULL pointers to kmem_cache_destroy() so if
> both allocations fail, it leads to a NULL dereference.

thanks, added that to next branch.

