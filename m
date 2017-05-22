From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Date: Mon, 22 May 2017 07:59:23 +0000
Subject: Re: [PATCH] perf/core: potential NULL deref if perf_event_alloc() fails
Message-Id: <8737bx1fvo.fsf@ashishki-desk.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170519212955.t723zbuywm4x2uwt@mwanda>
In-Reply-To: <20170519212955.t723zbuywm4x2uwt@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> I found this bug by looking for places where we do ERR_PTR(0).  The
> callers for perf_event_alloc() don't expect NULL returns and will oops.
> At first it looked like perf_init_event() can return NULL, but that's
> actually dead code.  I removed it.  But if the kcalloc() fails then we
> do need to set err = -ENOMEM.

I'd say this needs to be (at least) two patches, both with much better
commit messages.

Regards,
--
Alex
