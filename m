From: Pekka J Enberg <penberg@cs.Helsinki.FI>
Date: Tue, 08 Nov 2005 15:11:40 +0000
Subject: Re: [KJ] [PATCH 4/8] Cleanup kmem_cache_create()
Message-Id: <Pine.LNX.4.58.0511081710280.26730@sbz-30.cs.Helsinki.FI>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96422577907544138=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com> <436FF70D.6040604@us.ibm.com>
 <20051108150008.GL23749@parisc-linux.org>
In-Reply-To: <20051108150008.GL23749@parisc-linux.org>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Matthew Dobson <colpatch@us.ibm.com>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

--===============96422577907544138==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 8 Nov 2005, Matthew Wilcox wrote:
> +/*
> + * Calculate size (in pages) of slabs, and the num of objs per slab.  This
> + * could be made much more intelligent.  For now, try to avoid using high
> + * page-orders for slabs.  When the gfp() funcs are more friendly towards
> + * high-order requests, this should be changed.
> + */
> +static size_t find_best_slab_order(kmem_cache_t *cachep, size_t size,
> +					 size_t align, unsigned long flags)
> +{

Looks ok to me. I would prefer this to be called calculate_slab_order() 
instead though.

			Pekka

--===============96422577907544138==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96422577907544138==--
