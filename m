From: Giuseppe CAVALLARO <peppe.cavallaro@st.com>
Date: Wed, 10 May 2017 06:56:59 +0000
Subject: Re: [PATCH 0/4] net: stmmac: Fine-tuning for four function implementations
Message-Id: <97182590-698a-6c30-6143-9a9c9b1140aa@st.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <aa58027a-a39c-963e-4376-a4d5312ee118@users.sourceforge.net>
In-Reply-To: <aa58027a-a39c-963e-4376-a4d5312ee118@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hello Markus

Thanks a lot for your effort on stmmac

On 5/9/2017 1:51 PM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 9 May 2017 13:48:03 +0200
>
> A few update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (4):
>    Combine three seq_printf() calls into a seq_puts() in stmmac_sysfs_dma_cap_read()
>    Replace five seq_printf() calls by seq_puts()
>    Use seq_putc() in sysfs_display_ring()
>    Delete an unnecessary return statement in stmmac_get_tx_hwtstamp()
>
>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 22 ++++++++++------------
>   1 file changed, 10 insertions(+), 12 deletions(-)

Acked-by: Giuseppe Cavallaro <peppe.cavallaro@st.com>


