From: Vasiliy Kulikov <segoon@openwall.com>
Date: Wed, 24 Nov 2010 18:33:00 +0000
Subject: Re: [PATCH v2] gpu: vga: limit kmalloc'ed memory size
Message-Id: <20101124183300.GA31411@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290445864-13657-1-git-send-email-segoon@openwall.com>
 <20101122100915.5bf966fe.akpm@linux-foundation.org>
 <20101123190828.GA27159@albatros>
 <20101123124600.4401ea43.akpm@linux-foundation.org>
In-Reply-To: <20101123124600.4401ea43.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-janitors@vger.kernel.org, Dave Airlie <airlied@redhat.com>, Tiago Vignatti <tiago.vignatti@nokia.com>, Mike Travis <travis@sgi.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org

Andrew,

On Tue, Nov 23, 2010 at 12:46 -0800, Andrew Morton wrote:
> What I'm suggesting is that we simply do
> 
> 	kbuf = strndup_user(buf, count);
> 
> and make strndup_user() do the right thing if `count' turned out to be
> crazy large.  THis way we don't have to sprinkle decisions about "crazy
> largeness" all over the kernel.
> 
> And the way in which I suggest that strndup_user() decides whether the
> length is too great is to try to kmalloc that amount of memory. 
> If it succeeds then fine, proceed.

I don't think that it is a good idea - the process would have an ability
to allocate too much system memory bypassing any limits.  Assuming that
the kernel would only double the memory is not right - even if the
process is limited in physical memory it may pass address of e.g. mapped file.


Also this specific driver is happy with very low limit of copied string.

> If it fails then return an error,
> probably ENOMEM.

It is already done in strndup_user().

> And that attempt to invoke kmalloc() shouldn't spew a
> warning.

It is not obvious for me to change strndup_user's behaviour, I'm not
familiar with this code.


-- 
Vasiliy Kulikov
http://www.openwall.com - bringing security into open computing environments
