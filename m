From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Sun, 20 Mar 2011 12:54:30 +0000
Subject: Re: [patch] nfs: lock() vs unlock() typo
Message-Id: <20110320125430.GO22723@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110320112207.GM2008@bicker>
In-Reply-To: <20110320112207.GM2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Trond Myklebust <Trond.Myklebust@netapp.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Mar 20, 2011 at 02:22:07PM +0300, Dan Carpenter wrote:
> These should be spin_unlock() instead of spin_lock().  It's a typo.

Gyah...  Applied, thanks.
