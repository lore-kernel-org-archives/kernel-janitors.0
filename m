From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 22 Dec 2020 19:10:03 +0000
Subject: Re: [PATCH] MAINTAINERS: include governors into CPU IDLE TIME MANAGEMENT FRAMEWORK
Message-Id: <CAJZ5v0gC_SLBvSsGC=1OJ-uNEVPC=JLwELEZKj=LKoQkoOuEkQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201217071501.31267-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201217071501.31267-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, Linux PM <linux-pm@vger.kernel.org>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Dec 17, 2020 at 8:16 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> The current pattern in the file entry does not make the files in the
> governors subdirectory to be a part of the CPU IDLE TIME MANAGEMENT
> FRAMEWORK.
>
> Adjust the file pattern to include files in governors.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on current master and next-20201215
>
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 952731d1e43c..ac679aa00e0d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4596,7 +4596,7 @@ B:        https://bugzilla.kernel.org
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git
>  F:     Documentation/admin-guide/pm/cpuidle.rst
>  F:     Documentation/driver-api/pm/cpuidle.rst
> -F:     drivers/cpuidle/*
> +F:     drivers/cpuidle/
>  F:     include/linux/cpuidle.h
>
>  CPU POWER MONITORING SUBSYSTEM
> --

Applied as 5.11-rc material, thanks!

>
