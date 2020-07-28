From: Amit Kucheria <amit.kucheria@linaro.org>
Date: Tue, 28 Jul 2020 05:30:43 +0000
Subject: Re: [PATCH] MAINTAINERS: update entry to thermal governors file name prefixing
Message-Id: <CAP245DW1gY8sbFYxmZdAT_zC4GxT8mSmA8Zwpz28KFhe++e_7A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200728045850.22661-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200728045850.22661-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, Linux PM list <linux-pm@vger.kernel.org>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Jul 28, 2020 at 10:29 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 0015d9a2a727 ("thermal/governors: Prefix all source files with
> gov_") renamed power_allocator.c to gov_power_allocator.c in
> ./drivers/thermal amongst some other file renames, but missed to adjust
> the MAINTAINERS entry.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
>
>   warning: no file matches    F:    drivers/thermal/power_allocator.c
>
> Update the file entry in MAINTAINERS to the new file name.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
> Amit, please ack.
>
> Daniel, please pick this non-urgent minor patch for your -next tree.
>
> applies cleanly on next-20200727
>
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aad65cc8f35d..aa5a11d71f71 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17164,7 +17164,7 @@ M:      Lukasz Luba <lukasz.luba@arm.com>
>  L:     linux-pm@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/driver-api/thermal/power_allocator.rst
> -F:     drivers/thermal/power_allocator.c
> +F:     drivers/thermal/gov_power_allocator.c
>  F:     include/trace/events/thermal_power_allocator.h
>
>  THINKPAD ACPI EXTRAS DRIVER
> --
> 2.17.1
>
