From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 28 Dec 2019 11:30:42 +0000
Subject: Re: [PATCH] nvmem: core: Fix a potential use after free
Message-Id: <278a19c4-c794-8de7-7cb4-1e1da3b80e83@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577438434-9945-1-git-send-email-vulab@iscas.ac.cn>
In-Reply-To: <1577438434-9945-1-git-send-email-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xu Wang <vulab@iscas.ac.cn>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> Free the nvmem structure only after we are done using it.

This information can be reasonable.


> This patch just moves the put_device() down a bit to avoid the
> use after free.

I suggest to reconsider such a change because a device reference count
should eventually be decremented before decrementing the reference count
for the module which is managed by this programming interface.
Are you also looking for better software documentation for such an use case?

Regards,
Markus
