From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Dec 2012 16:59:21 +0000
Subject: Re: [patch] vfs: clear to the end of the buffer on reads
Message-Id: <20121205165921.GM6568@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121205124403.GA31930@elgon.mountain>
 <CA+55aFyCuepCzYq4zsLJyMO0yKzb=jD0-zv9zG6RyFYABOGe5w@mail.gmail.com>
In-Reply-To: <CA+55aFyCuepCzYq4zsLJyMO0yKzb=jD0-zv9zG6RyFYABOGe5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Romain Francoise <romain@orebokech.com>, Meelis Roos <mroos@linux.ee>, Tony Luck <tony.luck@intel.com>

On Wed, Dec 05, 2012 at 07:17:16AM -0800, Linus Torvalds wrote:
> On Wed, Dec 5, 2012 at 4:44 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > READ is zero so this test is always false.  (rw = READ) was intended.
> 
> Actually, that really *is* a bitmask, but yeah, the test is wrong.
> 
> The correct test is
> 
>   ((rw & RW_MASK) = READ)
> 

Ah.  Of course.  I'll send a v2.

regards,
dan carpenter

