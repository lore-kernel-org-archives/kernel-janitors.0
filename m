From: Andi Kleen <ak@linux.intel.com>
Date: Sun, 28 Mar 2010 20:55:14 +0000
Subject: Re: [patch] drm: sysfs files error handling
Message-Id: <4BAFC232.8010404@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100328112438.GK5069@bicker>
In-Reply-To: <20100328112438.GK5069@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, David Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@suse.de>, Thomas Hellstrom <thellstrom@vmware.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, dri-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

, Dan Carpenter wrote:
>
> In the original code we used "j" as an iterator but we used "i" as an
> index.
>
> -               for (j = 0; j<  i; j++)
> -                       device_remove_file(&connector->kdev,
> -&connector_attrs[i]);

I guess this really should be a attribute group anyways?

Typically when there's such a open coded loop it means the wrong
interfaces are being used.

-Andi

