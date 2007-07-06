From: Peter Zijlstra <peterz@infradead.org>
Date: Fri, 06 Jul 2007 17:04:39 +0000
Subject: [KJ] Re: [PATCH] some kmalloc/memset ->kzalloc (tree wide)
Message-Id: <1183741479.7054.111.camel@twins>
List-Id: <kernel-janitors.vger.kernel.org>
References: <878x9ta320.fsf@wanadoo.fr>
In-Reply-To: <878x9ta320.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: kernel-janitors@lists.osdl.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, Christoph Lameter <clameter@sgi.com>

On Fri, 2007-07-06 at 18:51 +0200, Yoann Padioleau wrote:
> Transform some calls to kmalloc/memset to a single kzalloc (or
> kcalloc).
> 

Christoph, what is the plan wrt GFP_ZERO?

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
