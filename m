From: Timur Tabi <timur@freescale.com>
Date: Wed, 01 Sep 2010 18:40:05 +0000
Subject: Re: [PATCH 1/4] drivers/serial/ucc_uart.c: Add of_node_put to avoid
Message-Id: <AANLkTikDfFkwKMmn8d1pqUrn+=KL4YH_PE3uXehq-6FG@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283269738-14612-1-git-send-email-julia@diku.dk>
	<1283269738-14612-2-git-send-email-julia@diku.dk>
In-Reply-To: <1283269738-14612-2-git-send-email-julia-dAYI7NvHqcQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Aug 31, 2010 at 10:48 AM, Julia Lawall <julia@diku.dk> wrote:
> Add a call to of_node_put in the error handling code following a call to
> of_find_compatible_node or of_find_node_by_type.
>
> This patch also substantially reorganizes the error handling code in the
> function, to that it is possible first to jump to code that frees qe_port
> and then to jump to code that also puts np.

Acked-by: Timur Tabi <timur@freescale.com>

Thanks, Julia.

-- 
Timur Tabi
Linux kernel developer at Freescale
