From: Sowjanya Komatineni <skomatineni@nvidia.com>
Date: Mon, 11 May 2020 19:44:11 +0000
Subject: Re: [PATCH] MAINTAINERS: correct path in TEGRA VIDEO DRIVER
Message-Id: <00ec3aa4-07c5-49ed-df89-de3f7f8b8cd8@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200511192844.11044-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200511192844.11044-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 5/11/20 12:28 PM, Lukas Bulwahn wrote:
> Commit 423d10a99b30 ("media: tegra: Add Tegra210 Video input driver") added
> the driver to drivers/staging/media/tegra-video/, but commit 2c6b617f2cca
> ("MAINTAINERS: Add Tegra Video driver section") added a file entry
> referring to drivers/staging/media/tegra/.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
>
>    warning: no file matches  F:  drivers/staging/media/tegra/
>
> Adjust the file entry in TEGRA VIDEO DRIVER to the correct path.
>
> Signed-off-by: Lukas Bulwahn<lukas.bulwahn@gmail.com>
> ---
> Sowjanya, please ack this minor patch.
>
> applies cleanly on next-20200511
>
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
Acked-by: Sowjanya Komatineni <skomatineni@nvidia.com>
