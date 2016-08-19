From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 19 Aug 2016 07:41:10 +0000
Subject: Re: [PATCH 0/2] GPU-DRM-Savage: Fine-tuning for savage_bci_cmdbuf()
Message-Id: <20160819074110.GT6232@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <77052ac1-1933-49af-3ad8-6e0eecc1aafe@users.sourceforge.net>
In-Reply-To: <77052ac1-1933-49af-3ad8-6e0eecc1aafe@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Julia Lawall <julia.lawall@lip6.fr>

On Thu, Aug 18, 2016 at 09:42:33PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 18 Aug 2016 21:38:37 +0200
> 
> A few update suggestions were taken into account
> from static source code analysis.

savage is one of the dri1 legacy drivers, imo not really worth it to spend
time on them. otoh no one will notice any breakage either ;-)

I guess I'll apply.
-Daniel

> 
> Markus Elfring (2):
>   Use memdup_user() rather than duplicating its implementation
>   Less function calls after error detection
> 
>  drivers/gpu/drm/savage/savage_state.c | 42 +++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 24 deletions(-)
> 
> -- 
> 2.9.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
