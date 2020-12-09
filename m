From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
Date: Wed, 09 Dec 2020 07:28:45 +0000
Subject: Re: [PATCH] block/rnbd-clt: Fix error code in rnbd_clt_add_dev_symlink()
Message-Id: <BYAPR04MB4965FB681969584B8F3E1F4586CC0@BYAPR04MB4965.namprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9B0IyxwbBDq+cSS@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Danil Kipnis <danil.kipnis@cloud.ionos.com>, Md Haris Iqbal <haris.iqbal@cloud.ionos.com>
Cc: Jack Wang <jinpu.wang@cloud.ionos.com>, Jens Axboe <axboe@kernel.dk>, Lutz Pogrell <lutz.pogrell@cloud.ionos.com>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 12/8/20 10:54 PM, Dan Carpenter wrote:
> The "ret" variable should be set to -ENOMEM but it returns uninitialized
> stack data.
>
> Fixes: 64e8a6ece1a5 ("block/rnbd-clt: Dynamically alloc buffer for pathname & blk_symlink_name")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good.

Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
