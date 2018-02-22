From: David Daney <ddaney@caviumnetworks.com>
Date: Thu, 22 Feb 2018 18:10:30 +0000
Subject: Re: [PATCH] MIPS: OCTEON: irq: check for null return on kzalloc allocation
Message-Id: <dba1d5b6-d568-c1a1-5e6c-7a00da3d1e01@caviumnetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180222180853.11505-1-colin.king@canonical.com>
In-Reply-To: <20180222180853.11505-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, "Steven J . Hill" <Steven.Hill@cavium.com>, David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 02/22/2018 10:08 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The allocation of host_data is not null checked, leading to a
> null pointer dereference if the allocation fails. Fix this by
> adding a null check and return with -ENOMEM.
> 
> Fixes: 64b139f97c01 ("MIPS: OCTEON: irq: add CIB and other fixes")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: David Daney <david.daney@cavium.com>


> ---
>   arch/mips/cavium-octeon/octeon-irq.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
> index b993d9f2c9b9..203e1d2a56d5 100644
> --- a/arch/mips/cavium-octeon/octeon-irq.c
> +++ b/arch/mips/cavium-octeon/octeon-irq.c
> @@ -2277,6 +2277,8 @@ static int __init octeon_irq_init_cib(struct device_node *ciu_node,
>   	}
>   
>   	host_data = kzalloc(sizeof(*host_data), GFP_KERNEL);
> +	if (!host_data)
> +		return -ENOMEM;
>   	raw_spin_lock_init(&host_data->lock);
>   
>   	addr = of_get_address(ciu_node, 0, NULL, NULL);
> 

