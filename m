From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 May 2020 10:04:53 +0000
Subject: Re: [PATCH 4/4 v2] firmware: stratix10-svc: Slightly simplify code
Message-Id: <20200506100453.GA9365@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1588142343.git.christophe.jaillet@wanadoo.fr>
 <8c505c686438c54da61ad4fe15e1eae722011153.1588142343.git.christophe.jaillet@wanadoo.fr>
 <1f8ae50d-6830-7fbb-e999-3e8110fe7cd6@linux.intel.com>
In-Reply-To: <1f8ae50d-6830-7fbb-e999-3e8110fe7cd6@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Gong <richard.gong@linux.intel.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, gregkh@linuxfoundation.org, atull@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, May 01, 2020 at 10:40:20AM -0500, Richard Gong wrote:
> Hi,
> 
> On 4/29/20 1:52 AM, Christophe JAILLET wrote:
> > Replace 'devm_kmalloc_array(... | __GFP_ZERO)' with the equivalent and
> > shorter 'devm_kcalloc(...)'.
> > 
> It doesn't make much sense.
> Actually devm_kcalloc returns devm_kmalloc_array(.., flag | __GFP_ZERO).
> 

devm_kcalloc() is better style and easier to read.  I was just reading
a bunch of AMD code that does this and I almost complained to them
that devm_kmalloc_array() doesn't zero the memory so they were freeing
uninitialized pointers.

regards,
dan carpenter
