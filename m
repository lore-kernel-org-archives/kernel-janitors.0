From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 07 Jan 2021 17:19:25 +0000
Subject: Re: [PATCH 3/3] powercap/drivers/dtpm: Fix an IS_ERR() vs NULL check
Message-Id: <CAJZ5v0gvT07A8Edf-NqwnBkcPnCciht52pm33VjDdbS=1qbEEg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X/V8zHPwlGiSxq1M@mwanda> <5cd25798-5dc1-4e8b-61a6-5a5f425f9473@linaro.org>
In-Reply-To: <5cd25798-5dc1-4e8b-61a6-5a5f425f9473@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lukasz Luba <lukasz.luba@arm.com>, Linux PM <linux-pm@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Jan 7, 2021 at 6:04 PM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
> On 06/01/2021 10:03, Dan Carpenter wrote:
> > The powercap_register_control_type() function never returns NULL, it
> > returns error pointers on error so update this check.
> >
> > Fixes: a20d0ef97abf ("powercap/drivers/dtpm: Add API for dynamic thermal power management")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>
> Thanks for these fixes.

All 3 patches applied, but as the original DTPM changes have not made
it into 5.11-rc, all of this is 5.12 material now.
