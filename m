From: JC Kuo <jckuo@nvidia.com>
Date: Tue, 11 Aug 2020 01:18:35 +0000
Subject: Re: [PATCH] usb: gadget: tegra-xudc: Avoid GFP_ATOMIC where it is not needed
Message-Id: <f29c7d35-72a9-b8d1-98dc-427c6fa3cc31@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200809072948.743269-1-christophe.jaillet@wanadoo.fr>
 <20200810140035.GA808811@ulmo>
In-Reply-To: <20200810140035.GA808811@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, yuehaibing@huawei.com, heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Looks good to me.

Reviewed-by: JC Kuo <jckuo@nvidia.com>

On 8/10/20 10:00 PM, Thierry Reding wrote:
> On Sun, Aug 09, 2020 at 09:29:48AM +0200, Christophe JAILLET wrote:
>> There is no need to use GFP_ATOMIC here. It is a probe function, no
>> spinlock is taken.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>  drivers/usb/gadget/udc/tegra-xudc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> Looks good to me. I can't think of any reason why this would have to be
> an atomic allocation. Nagarjuna, please shout if this is really needed,
> otherwise:
>
> Acked-by: Thierry Reding <treding@nvidia.com>
