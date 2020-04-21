From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Apr 2020 11:51:12 +0000
Subject: Re: [bug report] drm/xen-front: Add support for Xen PV display frontend
Message-Id: <20200421115112.GB2682@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200421104522.GA86681@mwanda>
 <28cc7f7c-fe0a-fd06-d330-73531b818a79@epam.com>
In-Reply-To: <28cc7f7c-fe0a-fd06-d330-73531b818a79@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>

It turns out there aren't that many of these in xen.

$ grep IS_ERR_OR_NULL drivers/gpu/drm/xen/ -Rn
drivers/gpu/drm/xen/xen_drm_front_kms.c:63:     if (IS_ERR_OR_NULL(fb))
drivers/gpu/drm/xen/xen_drm_front_gem.c:86:     if (IS_ERR_OR_NULL(xen_obj))
drivers/gpu/drm/xen/xen_drm_front_gem.c:120:    if (IS_ERR_OR_NULL(xen_obj->pages)) {
drivers/gpu/drm/xen/xen_drm_front_gem.c:139:    if (IS_ERR_OR_NULL(xen_obj))
drivers/gpu/drm/xen/xen_drm_front_gem.c:197:    if (IS_ERR_OR_NULL(xen_obj))
drivers/gpu/drm/xen/xen_drm_front.c:403:        if (IS_ERR_OR_NULL(obj)) {

They're all wrong, because if the pointer was really NULL then it's
not handled correctly and would eventually lead to a runtime failure.

Normally Smatch is smart enough to know that the pointer isn't NULL so
it doesn't generate a warning but yesterday I introduced a bug in Smatch
by mistake.  It's fixed now.

regards,
dan carpenter
