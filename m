From: Joe Perches <joe@perches.com>
Date: Tue, 24 Oct 2017 14:42:28 +0000
Subject: Re: drm/i915/gvt: Use common error handling code in shadow_workload_ring_buffer()
Message-Id: <1508856148.1955.12.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f563de94-afaa-ecde-2907-d6baaad65939@users.sourceforge.net>
 <87efpsiu7r.fsf@intel.com>
 <636f6272-9074-53dc-2c90-cbb4a7cd0901@users.sourceforge.net>
 <1A433E6A-DE06-4407-9E33-3CBBA4ADF01B@gmail.com>
 <20171024142615.t3y5atz6nulkq55h@mwanda>
In-Reply-To: <20171024142615.t3y5atz6nulkq55h@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Garry Hurley <garry.hurley.jr@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org, SF Markus Elfring <elfring@users.sourceforge.net>

On Tue, 2017-10-24 at 17:26 +0300, Dan Carpenter wrote:
> The point of unwind code is to undo what was done earlier.  If a
> function allocates a list of things, using standard unwind style makes
> it simpler, safer and more readable.
> 
> This isn't the case here.  Instead of making the code more readable,
> we're making it more convoluted.  It's just that two out of three error
> messages happened to be the same and Markus wants to save a bit of
> memory by using the same string.  The memory savings is not so big that
> it's worth making the code less readable.

I agree with Dan.

It doesn't save any real memory either as the compiler/linker
reuses the repeated string.

It might, depending on the compiler, save a few bytes of
object code as the compiler may not optimize the repeated
call away though.  But a good compiler could do that too.
