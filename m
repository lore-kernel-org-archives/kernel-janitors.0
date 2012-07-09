From: Christoph Lameter <cl@linux.com>
Date: Mon, 09 Jul 2012 13:53:13 +0000
Subject: Re: [PATCH 3/7] mm/slub.c: remove invalid reference to list iterator variable
Message-Id: <alpine.DEB.2.00.1207090853010.27519@router.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1341747464-1772-1-git-send-email-Julia.Lawall@lip6.fr> <1341747464-1772-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1341747464-1772-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Pekka Enberg <penberg@kernel.org>, Matt Mackall <mpm@selenic.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org

On Sun, 8 Jul 2012, Julia Lawall wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> If list_for_each_entry, etc complete a traversal of the list, the iterator
> variable ends up pointing to an address at an offset from the list head,
> and not a meaningful structure.  Thus this value should not be used after
> the end of the iterator.  The patch replaces s->name by al->name, which is
> referenced nearby.

Acked-by: Christoph Lameter <cl@linux.com>
