From: Joel Becker <Joel.Becker@oracle.com>
Date: Tue, 11 May 2010 18:53:30 +0000
Subject: Re: [PATCH 4/5] fs/ocfs2/dlm: Drop memory allocation cast
Message-Id: <20100511185329.GA10423@mail.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005112027000.4330@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005112027000.4330@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Mark Fasheh <mfasheh@suse.com>, ocfs2-devel@oss.oracle.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, May 11, 2010 at 08:28:14PM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Drop cast on the result of kmalloc and similar functions.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> type T;
> @@
> 
> - (T *)
>   (\(kmalloc\|kzalloc\|kcalloc\|kmem_cache_alloc\|kmem_cache_zalloc\|
>    kmem_cache_alloc_node\|kmalloc_node\|kzalloc_node\)(...))
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Joel Becker <joel.becker@oracle.com>

	You're welcome to push this.  Let me know if you want me to send
it via ocfs2.git.

Joel

-- 

Life's Little Instruction Book #451

	"Don't be afraid to say, 'I'm sorry.'"

Joel Becker
Principal Software Developer
Oracle
E-mail: joel.becker@oracle.com
Phone: (650) 506-8127
