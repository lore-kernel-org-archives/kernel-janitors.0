From: David Miller <davem@davemloft.net>
Date: Tue, 19 Feb 2019 21:25:18 +0000
Subject: Re: [PATCH v3] net: ns83820: code cleanup for ns83820_probe_phy()
Message-Id: <20190219.132518.1189223469188800915.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190219090635.134457-1-maowenan@huawei.com>
In-Reply-To: <20190219090635.134457-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, john.fastabend@gmail.com, hawk@kernel.org, jakub.kicinski@netronome.com, daniel@iogearbox.net, ast@kernel.org, julia.lawall@lip6.fr

From: Mao Wenan <maowenan@huawei.com>
Date: Tue, 19 Feb 2019 17:06:35 +0800

> This patch is to do code cleanup for ns83820_probe_phy().
> It deletes unused variable 'first' and commented out code.
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  v2->v3: delte unused variable 'first'; change subject from 
>  "net: ns83820: drop pointless static qualifier in ns83820_probe_phy()" to
>  "net: ns83820: code cleanup for ns83820_probe_phy()". 

Applied to net-next.
