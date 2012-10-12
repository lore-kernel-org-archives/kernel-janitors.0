From: Josh Triplett <josh@joshtriplett.org>
Date: Fri, 12 Oct 2012 19:10:18 +0000
Subject: Re: [next:akpm 86/86] drivers/block/drbd/drbd_int.h:50:10: sparse: preprocessor token __must_hold re
Message-Id: <20121012191018.GB4134@jtriplet-mobl1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121012164156.GD19120@localhost>
In-Reply-To: <20121012164156.GD19120@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Oct 13, 2012 at 12:41:56AM +0800, Fengguang Wu wrote:
> Hi Josh,
> 
> FYI, there are new sparse warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
> head:   04b956faad392f46c9a234962a9990196b8e48fc
> commit: 04b956faad392f46c9a234962a9990196b8e48fc [86/86] linux/compiler.h: add __must_hold macro for functions called with a lock held
> 
> + drivers/block/drbd/drbd_int.h:50:10: sparse: preprocessor token __must_hold redefined
>   include/linux/compiler.h:13:10: this was the original definition

Interesting; looks like drbd wanted the same thing and defined it locally.

>   drivers/block/drbd/drbd_int.h:977:39: sparse: attribute 'require_context': unknown attribute

These warnings occur because drbd tries to use Sparse features that
don't exist in a released version of Sparse.  I'd say drbd needs some
fixing.

I'd propose dropping the DRBD __must_hold in favor of the
linux/compiler.h definition.  If require_context goes into a released
version of Sparse, I can add it to the linux/compiler.h definition.

- Josh Triplett
