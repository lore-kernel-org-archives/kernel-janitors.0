From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Tue, 02 Jun 2020 19:35:45 +0000
Subject: Re: spi: spi-ti-qspi: call pm_runtime_put on pm_runtime_get failure
Message-Id: <CAEkB2ETDxZ3hgDtC_=Z_AG2Gsd3DO1HApcOzdJf5T0EeJ5DLPQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <26028f50-3fb8-eb08-3c9f-08ada018bf9e@web.de> <20200602094947.GA5684@sirena.org.uk>
 <1c13e0ec-e50f-9eea-5704-052d2d682727@web.de> <20200602141306.GH5684@sirena.org.uk>
 <cc8e1397-c605-d73e-363e-9d2ddfb9ae16@web.de> <20200602183644.GI5684@sirena.org.uk>
In-Reply-To: <20200602183644.GI5684@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-spi@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Dinghao Liu <dinghao.liu@zju.edu.cn>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Jun 2, 2020 at 1:36 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Jun 02, 2020 at 05:05:18PM +0200, Markus Elfring wrote:
> > >> I find this commit message improvable also according to Linux software
> > >> development documentation.
>
> > > Causing people to send out new versions of things for tweaks to the
> > > commit log consumes time for them and everyone they're sending changes to.
>
> > Improving patches (besides source code adjustments) is an usual software
> > development activity, isn't it?
>
> Your updates were not improvements.  The formatting was worse and to my
> native speaker eyes the grammar was worse.  With this sort of stylistic
> thing it's especially important that any review aligns with the needs
> and practices of the subsystem, there is opinion in there and multiple
> opinions just makes things harder for submitters.

Thanks Mark for your constructive opinion,
In most cases, such stylistic comments become confusing and
discouraging to those who are trying to chip in. Personally I think as
long as the patch does not contain typo and is not ambiguous from the
maintainer's perspective, it should be fine to let it go forward.



-- 
Navid.
