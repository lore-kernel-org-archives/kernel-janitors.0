From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 May 2018 15:41:50 +0000
Subject: Re: [PATCH v2] drm/dumb-buffers: Integer overflow in drm_mode_create_ioctl()
Message-Id: <20180516154150.iap2mm6h4rznod3n@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180516140026.GA19340@mwanda>
 <152648076734.11239.17221064386545833125@mail.alporthouse.com>
 <20180516145257.kct63hzesuey6jbc@mwanda>
 <152648261507.11239.9847993632251714966@mail.alporthouse.com>
 <20180516151554.grlkemklosrksxpm@mwanda>
In-Reply-To: <20180516151554.grlkemklosrksxpm@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Btw, I've looked at this some more and I'm 99% sure there is no way to
exploit it.  The "if (PAGE_ALIGN(size) = 0)" prevents the integer
overflow in __vgem_gem_create() that I was worried about.

regards,
dan carpenter


