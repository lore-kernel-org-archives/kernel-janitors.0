From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 07 Jan 2021 17:20:41 +0000
Subject: Re: [PATCH][next] powercap/drivers/dtpm: Fix size of object being allocated
Message-Id: <CAJZ5v0j8ysg35Tq3GZO+Eb1jH4wKjMEGaQeGA=qADTMU59y4wA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210104121053.33210-1-colin.king@canonical.com> <ea95f420-2a2e-d0f9-9b34-e329d80bbd9d@linaro.org>
In-Reply-To: <ea95f420-2a2e-d0f9-9b34-e329d80bbd9d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Colin King <colin.king@canonical.com>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Lukasz Luba <lukasz.luba@arm.com>, Linux PM <linux-pm@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jan 4, 2021 at 3:24 PM Daniel Lezcano <daniel.lezcano@linaro.org> w=
rote:
>
> On 04/01/2021 13:10, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > The kzalloc allocation for dtpm_cpu is currently allocating the size
> > of the pointer and not the size of the structure. Fix this by using
> > the correct sizeof argument.
> >
> > Addresses-Coverity: ("Wrong sizeof argument")
> > Fixes: 0e8f68d7f048 ("powercap/drivers/dtpm: Add CPU energy model based=
 support")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
> Good catch, thanks for fixing this
>
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Applied as 5.12 material, thanks!

> > ---
> >  drivers/powercap/dtpm_cpu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
> > index 6933c783c6b4..51c366938acd 100644
> > --- a/drivers/powercap/dtpm_cpu.c
> > +++ b/drivers/powercap/dtpm_cpu.c
> > @@ -200,7 +200,7 @@ static int cpuhp_dtpm_cpu_online(unsigned int cpu)
> >       if (!dtpm)
> >               return -EINVAL;
> >
> > -     dtpm_cpu =3D kzalloc(sizeof(dtpm_cpu), GFP_KERNEL);
> > +     dtpm_cpu =3D kzalloc(sizeof(*dtpm_cpu), GFP_KERNEL);
> >       if (!dtpm_cpu)
> >               goto out_kfree_dtpm;
> >
> >
>
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
