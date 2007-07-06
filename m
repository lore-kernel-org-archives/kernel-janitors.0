From: Christoph Lameter <clameter@sgi.com>
Date: Fri, 06 Jul 2007 17:54:29 +0000
Subject: [KJ] Re: [PATCH] some kmalloc/memset ->kzalloc (tree wide)
Message-Id: <Pine.LNX.4.64.0707061052570.30575@schroedinger.engr.sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <878x9ta320.fsf@wanadoo.fr> <1183741479.7054.111.camel@twins>
In-Reply-To: <1183741479.7054.111.camel@twins>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Yoann Padioleau <padator@wanadoo.fr>, kernel-janitors@lists.osdl.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

On Fri, 6 Jul 2007, Peter Zijlstra wrote:

> On Fri, 2007-07-06 at 18:51 +0200, Yoann Padioleau wrote:
> > Transform some calls to kmalloc/memset to a single kzalloc (or
> > kcalloc).
> > 
> 
> Christoph, what is the plan wrt GFP_ZERO?

Its going in AFAIK. Need to resort my patches and then I will push it 
back.

kzalloc will continue to exist as a shorthand notation. So no problem with 
continuing the conversion. kmalloc with GFP_ZERO may be more advantageous 
in allocator type functionality where the caller may want to specify if 
the allocated memory should be zeroed or not.

_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
