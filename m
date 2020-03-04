From: Rob Herring <robh@kernel.org>
Date: Wed, 04 Mar 2020 22:20:35 +0000
Subject: Re: [PATCH v2] MAINTAINERS: update ALLWINNER CPUFREQ DRIVER entry
Message-Id: <CAL_JsqKGhpdvrNGbq+yYeM=goOwNUewHYStT8b2PNiBVz+4JPw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200304212600.6172-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200304212600.6172-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Yangtao Li <tiny.windzz@gmail.com>, Maxime Ripard <maxime@cerno.tech>, "open list:THERMAL" <linux-pm@vger.kernel.org>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Mar 4, 2020 at 3:26 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit b30d8cf5e171 ("dt-bindings: opp: Convert Allwinner H6 OPP to a
> schema") converted in Documentation/devicetree/bindings/opp/ the file
> sun50i-nvmem-cpufreq.txt to allwinner,sun50i-h6-operating-points.yaml.
>
> Since then, ./scripts/get_maintainer.pl --self-test complains:
>
>   warning: no file matches \
>   F: Documentation/devicetree/bindings/opp/sun50i-nvmem-cpufreq.txt
>
> Adjust the file pattern in the ALLWINNER CPUFREQ DRIVER entry.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Changes to v1:
>   - do not include new maintainers because it is not needed.
>
> Maxime, Chen-Yu, Yangtao, please ack.
> Rob, please pick this patch.

Applied.

Rob
