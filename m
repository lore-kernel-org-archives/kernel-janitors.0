From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 29 Jul 2020 18:00:52 +0000
Subject: Re: [PATCH V2] dmaengine: bcm-sba-raid: add missing put_device() call in sba_probe()
Message-Id: <0510b837-cb5f-c8d0-8cd9-1c7c871a4ea0@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Yu Kuai <yukuai3@huawei.com>, dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Anup Patel <anup.patel@broadcom.com>, Dan Williams <dan.j.williams@intel.com>, Ray Jui <ray.jui@broadcom.com>, Vinod Koul <vkoul@kernel.org>, Yi Zhang <yi.zhang@huawei.com>

> if of_find_device_by_node() succeed, sba_probe() doesn't have a
> corresponding put_device(). …

Wording adjustment:
  If a of_find_device_by_node() call succeeded, sba_probe() did not
  contain a corresponding put_device() call. …

Regards,
Markus
