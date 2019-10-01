From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 01 Oct 2019 09:02:30 +0000
Subject: Re: [PATCH] RDMA/iw_cgxb4: Fix an error handling path in 'c4iw_connect()'
Message-Id: <20191001090229.GK27389@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190923190746.10964-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190923190746.10964-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: bharat@chelsio.com, dledford@redhat.com, jgg@ziepe.ca, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Sep 23, 2019 at 09:07:46PM +0200, Christophe JAILLET wrote:
> We should jump to fail3 in order to undo the 'xa_insert_irq()' call.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Not sure which Fixes tag to use because of the many refactorings in this
> area. So I've choosen to use none :).
> The issue was already there in 4a740838bf44c. This commit has renamed
> all labels because a new fail1 was introduced. I've not searched further.
> 
> Naming of error labels should be improved. Having nowadays a fail5
> between fail2 and fail3 (because fail5 was the last
> error handling path added) is not that readable.
> However, it goes beyong the purpose of this patch.
> 
> Maybe, just using a fail2a, just as already done in 9f5a9632e412 (which
> introduced fail5) would be enough.

I think/hope that you're joking.  Anyway, these are GW-BASIC style
labels.  The other anti-pattern that we sometimes see is come-from
labels where the code does:

	foo = kmalloc();
	if (!foo)
		goto kmalloc_failed;

We've no clue what the goto does.  And another anti-pattern is generic
names where we have "goto out;" instead of a better label name which
says what the goto does "goto unlock;".  Otherwise we have to scroll
down every time we encounter a goto.

Imagine if we used the same anti patterns for naming functions:

	called_from_frob_1();
	called_from_frob_2();

And with a string of error lables like this if we name the error labels
after what the label frees then it makes auditing the function very
easy.

	one = alloc();
	if (!one)
		return -ENOMEM;

	two = alloc();
	if (!two) {
		ret = -ENOMEM;
		goto free_one;
	}

	three = alloc();
	if (!three) {
		ret = -ENOMEM;
		goto free_two;
	}

We only need to remember the most recently allocated resource.  And if
we need to update the function later then the patch is minimal because
we only need to change the one goto and the error label.  No need to
re-number everything.  You can audit a patch with properly named labels
from directly within your email client instead of needing to re-review
the whole function in the source.

regards,
dan carpenter
