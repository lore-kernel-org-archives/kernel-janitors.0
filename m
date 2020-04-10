From: Sam Ravnborg <sam@ravnborg.org>
Date: Fri, 10 Apr 2020 12:14:06 +0000
Subject: Re: drm/tve200: Checking for a failed platform_get_irq() call in tve200_probe()
Message-Id: <20200410121406.GA31761@ravnborg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0263f4fb-c349-7651-b590-8722cdd30c85@web.de>
 <20200410101831.GA27723@ravnborg.org>
 <235b500a-0e5e-9ca3-4be5-9026c7d9f87f@web.de>
In-Reply-To: <235b500a-0e5e-9ca3-4be5-9026c7d9f87f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Tang Bin <tangbin@cmss.chinamobile.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org

Hi Markus.

On Fri, Apr 10, 2020 at 12:56:25PM +0200, Markus Elfring wrote:
> > The right way to check for errors is to check if the return value is
> > less than 0.
> 
> Thanks for your constructive feedback.
> 
> I was unsure if I noticed another programming mistake.
> 
> 
> > Could you please audit all uses of platform_get_irq() in drivers/gpu/
> 
> I found 20 source files from the software “Linux next-20200408”
> which seem to contain similar update candidates.
> Would you like to clarify any extensions for improved applications
> of scripts with the semantic patch language (Coccinelle software)
> for corresponding analysis and transformation purposes?
Please just send a series of patches, one for each driver.
Each changelog needs to explain the rationale behind the change.
Look at how this is often done.

As for coccinelle - I cannot help you.

	Sam
