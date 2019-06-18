From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Jun 2019 12:58:33 +0000
Subject: Re: [PATCH] drm: return -EFAULT if copy_one_buf() fails
Message-Id: <20190618125833.GG18776@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190618125623.GA24896@mwanda>
In-Reply-To: <20190618125623.GA24896@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>

Ah crap.  I need to fix copy_one_buf32() as well.  I will sent a v2.

regards,
dan carpenter
