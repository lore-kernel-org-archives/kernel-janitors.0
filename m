From: Edward Cree <ecree@solarflare.com>
Date: Fri, 10 Jan 2020 11:57:51 +0000
Subject: Re: [PATCH net-next] sfc: remove duplicated include from ef10.c
Message-Id: <422eff3d-05ea-d967-ff1b-448b6dc9dcb5@solarflare.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200110013517.37685-1-yuehaibing@huawei.com>
In-Reply-To: <20200110013517.37685-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: YueHaibing <yuehaibing@huawei.com>, "David S . Miller" <davem@davemloft.net>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jakub Kicinski <jakub.kicinski@netronome.com>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 10/01/2020 01:35, YueHaibing wrote:
> Remove duplicated include.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Acked-by: Edward Cree <ecree@solarflare.com>
but you seem to have come up with a strange CC list, full of bpf maintainers
 rather than sfc driver maintainers; check your submission scripts?  (AFAIK
 the MAINTAINERS file has the right things in.)

-Ed
> ---
>  drivers/net/ethernet/sfc/ef10.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/sfc/ef10.c b/drivers/net/ethernet/sfc/ef10.c
> index dc037dd927f8..fa460831af7d 100644
> --- a/drivers/net/ethernet/sfc/ef10.c
> +++ b/drivers/net/ethernet/sfc/ef10.c
> @@ -16,7 +16,6 @@
>  #include "workarounds.h"
>  #include "selftest.h"
>  #include "ef10_sriov.h"
> -#include "rx_common.h"
>  #include <linux/in.h>
>  #include <linux/jhash.h>
>  #include <linux/wait.h>
>
>
>
