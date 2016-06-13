From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Mon, 13 Jun 2016 13:44:55 +0000
Subject: Re: [patch] media: s5p-mfc: fix a couple double frees in probe
Message-Id: <CABxcv=kH3+dER8k=i4E5VYVYv9gy+rf9gqzOLfVyNkH50w3ZJQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160611195632.GA1403@mwanda>
In-Reply-To: <20160611195632.GA1403@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Shuah Khan <shuahkh@osg.samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kamil Debski <k.debski@samsung.com>, Jeongtae Park <jtp.park@samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hello Dan,

On Sat, Jun 11, 2016 at 3:56 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The extra calls to video_device_release() are a bug, we free these after
> the goto.
>
> Fixes: c974c436eaf4 ('s5p-mfc: Fix race between s5p_mfc_probe() and s5p_mfc_open()')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Thanks for the patch but Shuah already posted the same fix before:

https://lkml.org/lkml/2016/6/8/1210

Best regards,
Javier
