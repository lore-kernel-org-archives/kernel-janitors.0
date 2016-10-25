From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Oct 2016 08:40:32 +0000
Subject: Re: [PATCH 1/3] [media] au0828-video: Use kcalloc() in au0828_init_isoc()
Message-Id: <20161025084031.GF4469@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c6a37822-c0f9-1f1e-6ebe-a1c88c6d9d0a@users.sourceforge.net>
 <68ad1aaa-c029-04b9-805a-e859f6c2d2d5@users.sourceforge.net>
In-Reply-To: <68ad1aaa-c029-04b9-805a-e859f6c2d2d5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rafael =?iso-8859-1?Q?Louren=E7o?= de Lima Chehab <chehabrafael@gmail.com>, Shuah Khan <shuah@kernel.org>, Wolfram Sang <wsa-dev@sang-engineering.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Oct 24, 2016 at 10:59:24PM +0200, SF Markus Elfring wrote:
> +	dev->isoc_ctl.transfer_buffer = kcalloc(num_bufs,
> +						sizeof(*dev->isoc_ctl
> +						       .transfer_buffer),

This is ugly.

regards,
dan carpenter

