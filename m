From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Sep 2016 20:24:19 +0000
Subject: Re: GPU-DRM-QXL: Move three assignments in qxl_device_init()
Message-Id: <20160922202419.GP13620@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ce810580-cc2b-32cc-a852-a355374c2100@users.sourceforge.net>
 <f7eb26ad-39be-2918-627b-5f4981d07808@users.sourceforge.net>
 <20160922100257.GN13620@mwanda>
 <45c2ad6e-fadc-8d4a-f6bd-ddf8604ec622@users.sourceforge.net>
In-Reply-To: <45c2ad6e-fadc-8d4a-f6bd-ddf8604ec622@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Bhaktipriya Shridhar <bhaktipriya96@gmail.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@lip6.fr>, Daniel Vetter <daniel.vetter@ffwll.ch>, Tejun Heo <tj@kernel.org>, Thierry Reding <treding@nvidia.com>

On Thu, Sep 22, 2016 at 03:11:25PM +0200, SF Markus Elfring wrote:
> > If you restricted yourself to fixing bugs only then you would maybe fix more
> > bugs than you introduce but as it you are making the kernel worse.
> 
> Would you like to discuss the statistics for my failure (or success) rate
> a bit more so that involved issues can be clarified in a constructive way?

It should be that you target 20 bug fixes for each new regression that
you add.

Since you are just sending clean ups, every bug you introduce sets us
further and further back.  There is no hope for improving the kernel
because you are not even trying to fix 20 bugs, only introducing them.

Once you fix 20 bugs, then you will be even and you can start sending
cleanups again.  This is fair.

regards,
dan carpenter

