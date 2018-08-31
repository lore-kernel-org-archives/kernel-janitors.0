From: Felix Manlunas <felix.manlunas@cavium.com>
Date: Fri, 31 Aug 2018 20:16:59 +0000
Subject: Re: [PATCH v2 net-next] liquidio: remove set but not used variable 'irh'
Message-Id: <20180831201659.GA1288@felix-thinkpad.cavium.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1535716436-87194-1-git-send-email-yuehaibing@huawei.com>
 <1535717036-88514-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1535717036-88514-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Derek Chickles <derek.chickles@caviumnetworks.com>, Satanand Burla <satananda.burla@caviumnetworks.com>, Felix Manlunas <felix.manlunas@caviumnetworks.com>, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Aug 31, 2018 at 12:03:56PM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/cavium/liquidio/request_manager.c: In function 'lio_process_iq_request_list':
> drivers/net/ethernet/cavium/liquidio/request_manager.c:383:27: warning:
>  variable 'irh' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: fix patch description,remove 'cHECK-'
> ---
>  drivers/net/ethernet/cavium/liquidio/request_manager.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cavium/liquidio/request_manager.c b/drivers/net/ethernet/cavium/liquidio/request_manager.c
> index bd0153e..c6f4cbd 100644
> --- a/drivers/net/ethernet/cavium/liquidio/request_manager.c
> +++ b/drivers/net/ethernet/cavium/liquidio/request_manager.c
> @@ -380,7 +380,6 @@ static inline void __copy_cmd_into_iq(struct octeon_instr_queue *iq,
>         u32 inst_count = 0;
>         unsigned int pkts_compl = 0, bytes_compl = 0;
>         struct octeon_soft_command *sc;
> -       struct octeon_instr_irh *irh;
>         unsigned long flags;
> 
>         while (old != iq->octeon_read_index) {
> @@ -402,14 +401,6 @@ static inline void __copy_cmd_into_iq(struct octeon_instr_queue *iq,
>                 case REQTYPE_RESP_NET:
>                 case REQTYPE_SOFT_COMMAND:
>                         sc = buf;
> -
> -                       if (OCTEON_CN23XX_PF(oct) || OCTEON_CN23XX_VF(oct))
> -                               irh = (struct octeon_instr_irh *)
> -                                       &sc->cmd.cmd3.irh;
> -                       else
> -                               irh = (struct octeon_instr_irh *)
> -                                       &sc->cmd.cmd2.irh;
> -
>                         /* We're expecting a response from Octeon.
>                          * It's up to lio_process_ordered_list() to
>                          * process  sc. Add sc to the ordered soft
> 

Acked-by: Felix Manlunas <felix.manlunas@cavium.com>
