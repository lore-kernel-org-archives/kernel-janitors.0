From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Tue, 20 Mar 2012 19:13:23 +0000
Subject: Re: [patch] aio: change a stray spin_unlock_bh() to spin_unlock()
Message-Id: <20120320191323.GL6589@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120320130919.GA11307@elgon.mountain>
In-Reply-To: <20120320130919.GA11307@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Benjamin LaHaise <bcrl@kvack.org>, linux-fsdevel@vger.kernel.org, linux-aio@kvack.org, kernel-janitors@vger.kernel.org

On Tue, Mar 20, 2012 at 04:09:19PM +0300, Dan Carpenter wrote:
> We missed this spin_unlock_bh() when we removed the _bh from the other
> locks in cb22bbe9f7 "aio: aio_nr_lock is taken only synchronously now"

Nice catch; folded into the offending commit
