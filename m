From: Christoph Hellwig <hch@infradead.org>
Date: Thu, 17 Aug 2017 07:33:13 +0000
Subject: Re: [PATCH] nvmet_fc: use list_for_each_safe()
Message-Id: <20170817073313.GA28231@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170817064023.daho5p5dncqhqdar@mwanda>
In-Reply-To: <20170817064023.daho5p5dncqhqdar@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Aug 17, 2017 at 09:41:53AM +0300, Dan Carpenter wrote:
> We are freeing the list and the current code dereferences "deferfcp"
> after it's freed.  Let's use list_for_each_entry_safe() instead.

James already sent the same patch and I've got it queued up.
