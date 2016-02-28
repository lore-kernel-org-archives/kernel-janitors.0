From: Javier Martinez Canillas <javier@osg.samsung.com>
Date: Sun, 28 Feb 2016 14:43:41 +0000
Subject: Re: [patch 1/2] [media] tvp5150: off by one
Message-Id: <56D3079D.4040306@osg.samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160227105109.GD14086@mwanda>
In-Reply-To: <20160227105109.GD14086@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hans.verkuil@cisco.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello Dan,

On 02/27/2016 07:51 AM, Dan Carpenter wrote:
> The ->input_ent[] array has TVP5150_INPUT_NUM elements so the > here
> should be >=.
>
> Fixes: f7b4b54e6364 ('[media] tvp5150: add HW input connectors support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

Thanks for the patch but Mauro already posted the same change before:

http://www.spinics.net/lists/linux-media/msg97721.html

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
