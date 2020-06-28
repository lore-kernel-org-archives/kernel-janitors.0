From: Matthew Wilcox <willy@infradead.org>
Date: Sun, 28 Jun 2020 16:35:39 +0000
Subject: Re: [PATCH] mm: Free unused pages in kmalloc_order()
Message-Id: <20200628163539.GA25523@casper.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c5f54ce3-dad6-a2aa-d32a-cc7620676b76@web.de>
In-Reply-To: <c5f54ce3-dad6-a2aa-d32a-cc7620676b76@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Long Li <lonuxli.64@gmail.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Pekka Enberg <penberg@kernel.org>

On Sun, Jun 28, 2020 at 01:17:59PM +0200, Markus Elfring wrote:
> > kmalloc(1024, GFP_HIGHUSER) can allocate memory normally,
> > kmalloc(64*1024, GFP_HIGHUSER) will cause a memory leak,
> 
> Would you like to explain the influence of the selected allocation size
> in a different way?

Markus, this is not useful.  Please stop.
