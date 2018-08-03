From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Fri, 03 Aug 2018 20:05:18 +0000
Subject: Re: [PATCH] vfs: potential deadlock in insert_inode_locked()
Message-Id: <20180803200518.GC30522@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180803193101.e422aso76vzbo3ko@kili.mountain>
In-Reply-To: <20180803193101.e422aso76vzbo3ko@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Aug 03, 2018 at 10:31:01PM +0300, Dan Carpenter wrote:
> We added a new error path to insert_inode_locked() but we need to drop
> the inode_hash_lock spin_lock before we return.

Folded, with credits.
