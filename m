From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Tue, 01 Oct 2019 17:32:41 +0000
Subject: Re: [PATCH v2] spi: gpio: prevent memory leak in spi_gpio_probe
Message-Id: <CAEkB2ES3-gotqS9184izf0fKOigFaFUetBiqekmYJPBgPWbSBQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190930205241.5483-1-navid.emamdoost@gmail.com> <6b55e753-5797-2bdc-fae6-f575a0ef8186@web.de>
In-Reply-To: <6b55e753-5797-2bdc-fae6-f575a0ef8186@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-spi@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Mark Brown <broonie@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Markus, thanks for your suggestions for improving the quality of
the patch. At the moment I prefer first get a confirmation from
contributors about the leak and then work on any possible improvements
for the patch.

Thanks,
Navid.

On Tue, Oct 1, 2019 at 4:11 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > … In order to avoid leak spi_contriller_put must
> > be called in case of failure for devm_add_action_or_reset.
>
> How does this wording fit to the diff display that you would like
> to add the function call “spi_master_put(master)” in
> one if branch?
>
>
> > Fixes: 8b797490b4db ("spi: gpio: Make sure spi_master_put() is called in every error path")
>
> Is there a need to complete the corresponding exception handling
> at any more source code places?
>
> Regards,
> Markus



-- 
Navid.
