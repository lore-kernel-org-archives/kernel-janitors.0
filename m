From: Chris Metcalf <cmetcalf@mellanox.com>
Date: Tue, 06 Sep 2016 15:25:53 +0000
Subject: Re: [PATCH 0/2] tile-module: Fine-tuning for module_alloc()
Message-Id: <2d160e46-0cee-7022-9e06-008a3fa97a67@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <764e5d1b-c7ab-c8aa-1482-334a00e11280@users.sourceforge.net>
In-Reply-To: <764e5d1b-c7ab-c8aa-1482-334a00e11280@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, Rusty Russell <rusty@rustcorp.com.au>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

On 9/3/2016 3:00 PM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 3 Sep 2016 20:52:10 +0200
>
> A few update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (2):
>    Use kmalloc_array()
>    Rename jump labels
>
>   arch/tile/kernel/module.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)

Thanks!  Taken into the tile tree.

-- 
Chris Metcalf, Mellanox Technologies
http://www.mellanox.com

