From: burns.ethan@gmail.com
Date: Fri, 15 Jun 2007 17:12:54 +0000
Subject: Re: [KJ] [PATCH] Centralize checking for adequate version of gcc.
Message-Id: <20070615180832.GA22184@eaburns.mooo.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0706150650010.25667@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0706150650010.25667@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jun 15, 2007 at 06:47:01PM +0200, Jaco Kroon wrote:

[...]

>  The comment explained _why_ those checks were done, ie, it generates bad
>  builds.  The pre-processor code simply states _which_ compilers are
>  acceptable.

Is it not enough that the error and warning messages them selves state *why*
the checks are being done?

#if (__GNUC__ < 3) || (__GNUC__ = 3 && __GNUC_MINOR__ < 2)
# error Sorry, your GCC is too old. It builds incorrect kernels.
#elif __GNUC__ = 4 && __GNUC_MINOR__ = 1 && __GNUC_PATCHLEVEL__ = 0
# warning gcc-4.1.0 is known to miscompile the kernel.  A different compiler
version is recommended.
#elif __GNUC__ = 4
...

I think that it is pretty explicit *why* the error and warning message are
being given in this code snip.


Ethan
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
