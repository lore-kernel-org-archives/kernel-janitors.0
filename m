From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Wed, 23 May 2018 04:15:51 +0000
Subject: Re: [PATCH] staging: greybus: fix spelling mistake: "Inavlid" -> "Invalid"
Message-Id: <CAAs364-Yp6d=VNiaykvGNgsGFMb20SfjvgALFXnTKAYTLSY6-w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180522083342.5722-1-colin.king@canonical.com>
In-Reply-To: <20180522083342.5722-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Mark Greer <mgreer@animalcreek.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 22, 2018 at 2:03 PM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>

> Trivial fix to spelling mistake in dev_err error message

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/staging/greybus/audio_topology.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/drivers/staging/greybus/audio_topology.c
b/drivers/staging/greybus/audio_topology.c
> index de4b1b2b12f3..15e57f701630 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -996,7 +996,7 @@ static int gbaudio_tplg_create_widget(struct
gbaudio_module_info *module,

>          ret = gbaudio_validate_kcontrol_count(w);
>          if (ret) {
> -               dev_err(module->dev, "Inavlid kcontrol count=%d for %s\n",
> +               dev_err(module->dev, "Invalid kcontrol count=%d for %s\n",
>                          w->ncontrols, w->name);
>                  return ret;
>          }
> --
> 2.17.0


Acked-by: Vaibhav Agarwal <vaibhav.sr@gmail.com>
