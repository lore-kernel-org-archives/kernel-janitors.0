From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 20 Apr 2018 06:07:43 +0000
Subject: Re: [PATCH 06/61] crypto: simplify getting .drvdata
Message-Id: <CAJKOXPcpOHF6a_XtvKD-PUw_CRsXXrb-fHSm+HOug9YX=zj68w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Thu, Apr 19, 2018 at 4:05 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Build tested only. buildbot is happy. Please apply individually.
>
>  drivers/crypto/exynos-rng.c       | 6 ++----
>  drivers/crypto/picoxcell_crypto.c | 6 ++----
>  2 files changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
