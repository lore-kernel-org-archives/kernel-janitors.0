From: Paul Cercueil <paul@crapouillou.net>
Date: Mon, 14 Oct 2019 13:05:21 +0000
Subject: Re: [PATCH] dmaengine: jz4780: Use devm_platform_ioremap_resource() in jz4780_dma_probe()
Message-Id: <1571058321.3.1@crapouillou.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5dd19f28-349a-4957-ea3a-6aebbd7c97e2@web.de>
        <1569353552.1911.0@crapouillou.net> <20191014071400.GD2654@vkoul-mobl>
In-Reply-To: <20191014071400.GD2654@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Vinod Koul <vkoul@kernel.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Alex Smith <alex.smith@imgtec.com>

Hi Vinod,



Le lun., oct. 14, 2019 at 12:44, Vinod Koul <vkoul@kernel.org> a =E9crit=20
:
> On 24-09-19, 21:32, Paul Cercueil wrote:
>>  Hi Markus,
>>=20
>>=20
>>  Le dim. 22 sept. 2019 =E0 11:25, Markus Elfring=20
>> <Markus.Elfring@web.de> a
>>  =E9crit :
>>  > From: Markus Elfring <elfring@users.sourceforge.net>
>>  > Date: Sun, 22 Sep 2019 11:18:27 +0200
>>  >
>>  > Simplify this function implementation a bit by using
>>  > a known wrapper function.
>>  >
>>  > This issue was detected by using the Coccinelle software.
>>  >
>>  > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>>=20
>>  Looks good to me.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>=20
> Did you mean Acked or Reviewed ...??

Definitely. Sorry about that.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>


>=20
> --
> ~Vinod
