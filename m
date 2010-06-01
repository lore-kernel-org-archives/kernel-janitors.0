From: Borislav Petkov <borislav.petkov@amd.com>
Date: Tue, 01 Jun 2010 08:23:05 +0000
Subject: Re: [patch] x86, cacheinfo: dereferences before check
Message-Id: <20100601082305.GA10650@aftab>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100601071126.GF5483@bicker>
In-Reply-To: <20100601071126.GF5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Tue, Jun 01, 2010 at 03:11:27AM -0400

> This moves a couple dereferences after the checks in
> show_cache_disable() and store_cache_disable().  These were introduced
> fairly recently in 9350f982e4: "x86, cacheinfo: Reorganize AMD L3 cache
> structure"

Yes, this is correct, thanks. However I have a couple of patches which
rewrite and cleanup this section even more and was waiting for the merge
window to close before sending out. Stay tuned...

-- 
Regards/Gruss,
Boris.

Operating Systems Research Center
Advanced Micro Devices, Inc.

