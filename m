From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
Date: Sat, 16 May 2020 04:30:27 +0000
Subject: Re: [PATCH] nvme: delete an unnecessary declaration
Message-Id: <BYAPR04MB4965F14859CEF98DCA8BD22686BA0@BYAPR04MB4965.namprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200515120659.GA575846@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@fb.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, Sagi Grimberg <sagi@grimberg.me>

On 05/15/2020 05:07 AM, Dan Carpenter wrote:
> The nvme_put_ctrl() is implemented earlier as an inline function so
> this declaration isn't required.
>
> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>

Looks good.

Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
