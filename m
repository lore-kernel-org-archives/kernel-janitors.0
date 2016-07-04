From: Alexandre Courbot <gnurou@gmail.com>
Date: Mon, 04 Jul 2016 01:39:36 +0000
Subject: Re: [PATCH] drm/tegra: fix error handling
Message-Id: <CAAVeFuLNgjqYtjoDD3Kxr04c8PSyLptX2RXM6a_m2epADEdvkg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1467526737-13591-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1467526737-13591-1-git-send-email-christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Sun, Jul 3, 2016 at 3:18 PM, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
> This is likely that checking 'gr3d->clk_secondary' instead of 'gr3d->clk'
> is expected here.

Very likely indeed.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks!
