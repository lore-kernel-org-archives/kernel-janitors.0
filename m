From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 10 Jan 2020 03:49:49 +0000
Subject: Re: [PATCH -next] drm/mgag200: Fix typo in parameter description
Message-Id: <20200110034949.GA1792@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200110012523.33053-1-weiyongjun1@huawei.com>
In-Reply-To: <20200110012523.33053-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>

On Fri, Jan 10, 2020 at 01:25:23AM +0000, Wei Yongjun wrote:
> Fix typo in parameter description.
> 

This commit message isn't totally clear.  Maybe say something like:

There was a typo in the MODULE_PARM_DESC().  It said that the module
parameter was "modeset" but it's actually the description for
"hw_bug_no_startadd".

> Fixes: 3cacb2086e41 ("drm/mgag200: Add module parameter to pin all buffers at offset 0")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

regards,
dan carpenter
