From: Andreas Oberritter <obi@linuxtv.org>
Date: Fri, 07 Jan 2011 12:44:15 +0000
Subject: Re: [patch] [media] av7110: make array offset unsigned
Message-Id: <4D270A9F.7080104@linuxtv.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110106194059.GC1717@bicker>
In-Reply-To: <20110106194059.GC1717@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On 01/06/2011 08:41 PM, Dan Carpenter wrote:
> In the CA_GET_SLOT_INFO ioctl, we only check whether "num" is too large,
> but we don't check if it's negative.
> 
> drivers/media/dvb/ttpci/av7110_ca.c
>    278		ca_slot_info_t *info=(ca_slot_info_t *)parg;
>    279
>    280		if (info->num > 1)
>    281			return -EINVAL;
>    282		av7110->ci_slot[info->num].num = info->num;
> 
> Let's just make it unsigned.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Nack. You're changing an interface to userspace. Please add a check to
av7110_ca.c instead.

Regards,
Andreas
