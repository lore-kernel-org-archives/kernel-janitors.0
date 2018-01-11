From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 Jan 2018 09:50:15 +0000
Subject: Re: [PATCH -next] gpio: thunderx: fix error return code in thunderx_gpio_probe()
Message-Id: <CACRpkdbACSBoj8HzTFw1z8WiMSeerSe6mkBxyk0KYOTrtTXEtQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1515595033-83888-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1515595033-83888-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: David Daney <david.daney@cavium.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 10, 2018 at 3:37 PM, Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Fix to return error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.
>
> Fixes: 5a2a30024d8c ("gpio: Add gpio driver support for ThunderX and OCTEON-TX")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied with David's ACK.

Yours,
Linus Walleij
