From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 20 Apr 2020 07:33:54 +0000
Subject: Re: [PATCH][next] sdhci: arasan: fix uninitialized value being returned as error code
Message-Id: <CAPDyKFocu+ckJE5WpMWuNTMJiwkfgQ4Ha-AXCF4mRJKMrhFa0A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200417154901.112236-1-colin.king@canonical.com>
In-Reply-To: <20200417154901.112236-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Michal Simek <michal.simek@xilinx.com>, Manish Narani <manish.narani@xilinx.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>

On Fri, 17 Apr 2020 at 17:49, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the error return value in variable ret is not being initialized
> and so a successful return path is returning a garbage value. Since ret
> is not being used the simple fix is just return 0 on a successful return.
>
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: f73e66a36772 ("sdhci: arasan: Add support for Versal Tap Delays")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks for the patch, but this time I have already applied [1] an
earlier fix for it.

Kind regards
Uffe

[...]

[1] https://patchwork.kernel.org/patch/11493633/
