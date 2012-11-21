From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Nov 2012 07:39:56 +0000
Subject: Re: [patch] x86, UV: integer wrap bug in uv_hub_ipi_value()
Message-Id: <20121121073956.GF6186@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121117151611.GB16900@elgon.mountain>
 <20121120004834.GE5060@sgi.com>
 <20121120042855.GE6186@mwanda>
 <20121120170723.GC11150@sgi.com>
In-Reply-To: <20121120170723.GC11150@sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russ Anderson <rja@sgi.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Dimitri Sivanich <sivanich@sgi.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Nov 20, 2012 at 11:07:25AM -0600, Russ Anderson wrote:
> The issue isn't "ulong" vs "unsigned long".  The issue
> is int is 32 bit and long is 64 bit on x86_64.  Your 
> patch is casting the value as an "unsigned long" (64 bit
> on x86_64) into an int (32 bit).  I don't think that
> was your intent.

Wait what?  I only did int => long casts, not the other way around.

It occured to me to use u64 but this code is only compiled on x86_64
and I wrote my patch to match the surrounding context.

regards,
dan carpenter
