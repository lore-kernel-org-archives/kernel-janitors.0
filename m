From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 28 Dec 2019 12:25:49 +0000
Subject: Re: nvmem: core: Checking the decrementing of reference counters
Message-Id: <2a95fa07-dfae-54ef-9d19-682bace02e5f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577438434-9945-1-git-send-email-vulab@iscas.ac.cn>
In-Reply-To: <1577438434-9945-1-git-send-email-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Xu Wang <vulab@iscas.ac.cn>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

I have taken another look at the implementation of the function “nvmem_device_release”.
https://elixir.bootlin.com/linux/v5.5-rc3/source/drivers/nvmem/core.c#L421
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/nvmem/core.c?id=bf8d1cd4386535004c4afe7f03d37f9864c9940e#n421

Now I wonder why the statement “put_device(&nvmem->dev)” is performed here
after it was also executed by the function “__nvmem_device_put” before.
How often should the device reference count be decremented (at the end)?

Regards,
Markus
