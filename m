From: Joe Perches <joe@perches.com>
Date: Sat, 03 Oct 2020 22:15:42 +0000
Subject: Re: [PATCH][next] power: supply: fix spelling mistake "unprecise" -> "imprecise"
Message-Id: <ebafdf9c1647070c45124786e71a0112f86d10b8.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200902101656.57676-1-colin.king@canonical.com>
         <20201003215102.5hl5lvidyki2xu7b@earth.universe>
In-Reply-To: <20201003215102.5hl5lvidyki2xu7b@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>, Colin King <colin.king@canonical.com>
Cc: linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 2020-10-03 at 23:51 +0200, Sebastian Reichel wrote:
> On Wed, Sep 02, 2020 at 11:16:56AM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > There is a spelling mistake in a dev_info message. Fix it.
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> 
> Thanks, queued.
[]
> > diff --git a/drivers/power/supply/rn5t618_power.c b/drivers/power/supply/rn5t618_power.c
[]
> > @@ -487,7 +487,7 @@ static int rn5t618_power_probe(struct platform_device *pdev)
> >  		 * gauge will get decalibrated.
> >  		 */
> >  		dev_info(&pdev->dev, "Fuel gauge not enabled, enabling now\n");
> > -		dev_info(&pdev->dev, "Expect unprecise results\n");
> > +		dev_info(&pdev->dev, "Expect imprecise results\n");

Might as well be a single line too

		dev_info(&pdev->dev, "Fuel gauge not enabled, enabling now - expect imprecise results\n");
