From: Jesse Barnes <jbarnes@virtuousgeek.org>
Date: Thu, 18 Dec 2008 23:40:07 +0000
Subject: Re: [PATCH 6/6] drm/i915: add prototype for 'intelfb_panic' to header file
Message-Id: <200812181540.08366.jbarnes@virtuousgeek.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <494ad5e4.0baa660a.04de.7bb4@mx.google.com>
In-Reply-To: <494ad5e4.0baa660a.04de.7bb4@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.sourceforge.net
Cc: Hannes Eder <hannes@hanneseder.net>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday, December 18, 2008 1:32 pm Hannes Eder wrote:
> Fix this sparse warning:
>
>   drivers/gpu/drm/i915/intel_fb.c:417:5: warning: symbol 'intelfb_panic'
> was not declared. Should it be static?

Yep, this one should be static instead (I think, just double checking now to 
make sure it's not used elsewhere, iirc it's not).

-- 
Jesse Barnes, Intel Open Source Technology Center

