From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Sep 2017 14:09:22 +0000
Subject: Re: [PATCH] drm: qxl: ratelimit pr_info message, reduce log spamming
Message-Id: <20170912140921.maegwq32x5a6jyql@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170912094548.30603-1-colin.king@canonical.com>
 <CACvgo53vbGbvejkEnQuuB-ZuVfbzvSmAsx3Ovj-wMWMQE8ihXw@mail.gmail.com>
In-Reply-To: <CACvgo53vbGbvejkEnQuuB-ZuVfbzvSmAsx3Ovj-wMWMQE8ihXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: kernel-janitors@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>, Colin King <colin.king@canonical.com>

On Tue, Sep 12, 2017 at 03:02:04PM +0100, Emil Velikov wrote:
> That said, I'm not sure how useful the information is - perhaps it's
> better to drop it all together?

Or a WARN_ONCE().

regards,
dan carpenter

