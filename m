From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 23 May 2013 10:12:40 +0000
Subject: Re: [patch] f2fs: dereferencing an ERR_PTR
Message-Id: <20130523101240.GG30128@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130523100213.GA19107@elgon.mountain>
In-Reply-To: <20130523100213.GA19107@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaegeuk Kim <jaegeuk.kim@samsung.com>
Cc: kernel-janitors@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

Btw, Linus's new Sparse changes don't like the f2fs's NEW_ADDR
macro.

#define NEW_ADDR                -1U

We use it like this:

	block_t src, dest;

	if (src != dest && dest != NEW_ADDR && dest != NULL_ADDR) {

block_t is 64 bits so probably the macro should probably be:

#define NEW_ADDR               ((block_t)-1)

I'm not able to test this so there may be some reason why changing
this breaks something.  In that case we could do:

#define NEW_ADDR               ((u32)(block_t)-1) /* explanation */

regards,
dan carpenter

