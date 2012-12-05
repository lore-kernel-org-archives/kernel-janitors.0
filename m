From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 05 Dec 2012 15:17:16 +0000
Subject: Re: [patch] vfs: clear to the end of the buffer on reads
Message-Id: <CA+55aFyCuepCzYq4zsLJyMO0yKzb=jD0-zv9zG6RyFYABOGe5w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121205124403.GA31930@elgon.mountain>
In-Reply-To: <20121205124403.GA31930@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Romain Francoise <romain@orebokech.com>, Meelis Roos <mroos@linux.ee>, Tony Luck <tony.luck@intel.com>

On Wed, Dec 5, 2012 at 4:44 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> READ is zero so this test is always false.  (rw = READ) was intended.

Actually, that really *is* a bitmask, but yeah, the test is wrong.

The correct test is

  ((rw & RW_MASK) = READ)

because the field can have other bits set too (REQ_SYNC or REQ_META or
whatever - read-ahead, other bits)

Alternatively, just "!(rw & WRITE)" I guess.

But thanks for noticing.

                  Linus
