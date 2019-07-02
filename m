From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 02 Jul 2019 10:44:20 +0000
Subject: Re: [PATCH][next] regulator: lp87565: fix missing break in switch statement
Message-Id: <20190702104420.GD4652@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190627131639.6394-1-colin.king@canonical.com>
 <20190628143628.GJ5379@sirena.org.uk>
 <4cb0e4ab-66c7-2b3d-27d3-fd5cfde8988f@canonical.com>
In-Reply-To: <4cb0e4ab-66c7-2b3d-27d3-fd5cfde8988f@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Mark Brown <broonie@kernel.org>, Keerthy <j-keerthy@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 28 Jun 2019, Colin Ian King wrote:

> On 28/06/2019 15:36, Mark Brown wrote:
> > On Thu, Jun 27, 2019 at 02:16:39PM +0100, Colin King wrote:
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> Currently the LP87565_DEVICE_TYPE_LP87561_Q1 case does not have a
> >> break statement, causing it to fall through to a dev_err message.
> >> Fix this by adding in the missing break statement.
> > 
> > This doesn't apply against current code, please check and resend.
> > 
> So it applies cleanly against linux-next, I think the original code
> landed in mfd/for-mfd-next - c.f. https://lkml.org/lkml/2019/5/28/550

Applied, thanks Colin.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
