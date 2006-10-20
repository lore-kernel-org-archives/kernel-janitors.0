From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Fri, 20 Oct 2006 02:54:25 +0000
Subject: Re: [KJ] [PATCH] Converted jiffy comparisons to time_after calls
Message-Id: <20061019195425.e4265a94.randy.dunlap@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200610191942.26865.karhudever@gmial.com>
In-Reply-To: <200610191942.26865.karhudever@gmial.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David KOENIG <karhudever@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

On Thu, 19 Oct 2006 19:42:26 -0700 David KOENIG wrote:

> >From 9180d29946eced4c71845c9bbe847e98e01d1c31 Mon Sep 17 00:00:00 2001
> From: David KOENIG <david@karhu.(none)>
> Date: Thu, 19 Oct 2006 18:57:17 -0700
> Subject: [PATCH] Converted jiffy comparisons to time_after calls
> ---
>  drivers/net/tokenring/3c359.c |   21 +++++++++++----------
>  1 files changed, 11 insertions(+), 10 deletions(-)

Yes, like that.  Thanks.

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
