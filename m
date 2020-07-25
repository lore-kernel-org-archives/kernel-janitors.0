From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 25 Jul 2020 10:50:29 +0000
Subject: Re: [PATCH] nbd: add missed destroy_workqueue when nbd_start_device fails
Message-Id: <d7b60d29-4a02-ae2a-fa9d-0c4918eba91a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Li Heng <liheng40@huawei.com>, linux-block@vger.kernel.org, nbd@other.debian.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>

> destroy_workqueue() should be called to destroy ndev->tx_wq
> when nbd_start_device init resources fails.

* An imperative wording can be preferred for the change description,
  can't it?

* Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
