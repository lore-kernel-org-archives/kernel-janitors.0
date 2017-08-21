From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 21 Aug 2017 11:50:37 +0000
Subject: Re: [PATCH] lib/cmdline.c: add to the get_options() documentation
Message-Id: <20170821115036.mg2v7wfl565kksht@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170821094602.baz6tv2v23sem3kw@mwanda>
 <D8F70276-D32C-4977-B66F-C78A60EE8C8A@gmail.com>
In-Reply-To: <D8F70276-D32C-4977-B66F-C78A60EE8C8A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ilya Matveychikov <matvejchikov@gmail.com>
Cc: Baoquan He <bhe@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, ben.hutchings@codethink.co.uk

On Mon, Aug 21, 2017 at 02:42:52PM +0400, Ilya Matveychikov wrote:
> 
> > On Aug 21, 2017, at 1:46 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > 
> > I wasn't sure how get_options() worked, so I looked at examples.  And by
> > sheer chance the first example I picked the only example which uses it
> > incorrectly...  I've added some comments that hopefully help.
> > 
> 
> See also comments on my patch from Ben Hutchings:
> https://patchwork.kernel.org/patch/9811617/

Ugh...  The implementation of get_options() looks gnarly, yes.  That
affects the part of my comment which says:

+ *     string.  It stores the number of numbers as the first element in the
+ *     array.

If we are going to keep the current behavior then we should specify that
ints[0] can be higher than "nints - 1".  But I feel like the current
behavior is wrong and that get_range() should never return more than n.

regards,
dan carpenter
