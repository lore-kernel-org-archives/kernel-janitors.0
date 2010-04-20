From: Dan Carpenter <error27@gmail.com>
Date: Tue, 20 Apr 2010 06:23:20 +0000
Subject: Re: [patch] i2o: cleanup exit paths
Message-Id: <20100420062320.GA4924@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100418193252.GE7920@bicker>
In-Reply-To: <20100418193252.GE7920@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Apr 19, 2010 at 02:47:38PM -0500, Christoph Lameter wrote:
> On Mon, 19 Apr 2010, Alan Cox wrote:
> 
> > Not sure I am the person to Cc. I've got no I2O hardware nor touched it
> > for a while. It looks sane to me but is un-owned really so I'd send it
> > either directly or via the trivial patch maintainer .
> 
> I guess he just randomly picked a couple of kernel developers.

./scripts/get_maintainer.pl

So...  Christoph, I did notice that I've been CC'ing you a lot recently, 
but I figured you had got a promotion or something.  I'll remove you
from the CC list from here out.  Probably you should have refused to ack 
Tejun's slab.h patch. The get_maintainer.pl script now thinks you two own 
97% of the kernel...

Guess-its-ok-by: Christoph Lameter <cl@linux-foundation.org>

regards,
dan carpenter
