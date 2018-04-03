From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Tue, 03 Apr 2018 10:04:22 +0000
Subject: Re: [PATCH] drm/amd/display: fix spelling mistake: "Usupported" -> "Unsupported"
Message-Id: <87o9j0a9nd.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180330160047.7368-1-colin.king@canonical.com>
 <87tvssaawl.fsf@intel.com> <alpine.DEB.2.20.1804031139110.3630@hadrien>
In-Reply-To: <alpine.DEB.2.20.1804031139110.3630@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Cc: David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Harry Wentland <harry.wentland-5C7GfCeVMHo@public.gmane.org>, Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Tue, 03 Apr 2018, Julia Lawall <julia.lawall@lip6.fr> wrote:
> On Tue, 3 Apr 2018, Jani Nikula wrote:
>> Please do consider limiting the distribution in the future,
>> though. There's no need to include lkml or even dri-devel for trivial
>> patches like this.
>
> It's complex to have to remember the preferences for every subsystem.
> Preferences should be expressed in the MAINTAINERS file in some way.

They are; it's just that get_maintainer.pl has silly defaults. There's
no reason it should include the full chain from the leaf driver to the
subsystem to the LKML by default, with a bunch of authors and commit
signers on top. Especially so for supported drivers. I'm surprised it
doesn't include Linus by default.

> Also, since no one reads lkml, does it hurt to have even trivial patches?

Heh. Let's just say I care more about dri-devel.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Technology Center
