From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 08 Aug 2017 10:38:20 +0000
Subject: Re: [PATCH 0/5] constify sdhci_pltfm_data and sdhci_ops structures
Message-Id: <CAPDyKFq_o4miacACc_hFdCD78s+tAxQ3sTHn9KPjV7vWNKX-iw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502099444-10473-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502099444-10473-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 7 August 2017 at 11:50, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> The sdhci_pltfm_data structures are only passed as the second
> argument of sdhci_pltfm_init, which is const, while the sdhci_ops
> structures are only stored in the ops field of a sdhci_pltfm_data
> structure, which is also const.  Thus both kinds of structures can
> be const as well.
>
> Done with the help of Coccinelle.
>
> ---
>
>  drivers/mmc/host/sdhci-bcm-kona.c  |    4 ++--
>  drivers/mmc/host/sdhci-brcmstb.c   |    2 +-
>  drivers/mmc/host/sdhci-of-arasan.c |    4 ++--
>  drivers/mmc/host/sdhci-pic32.c     |    2 +-
>  drivers/mmc/host/sdhci-pxav3.c     |    2 +-
>  drivers/mmc/host/sdhci-sirf.c      |    4 ++--
>  6 files changed, 9 insertions(+), 9 deletions(-)

Thanks, applied for next!

Kind regards
Uffe
