From: Vinod Koul <vkoul@kernel.org>
Date: Wed, 17 Jun 2020 13:59:54 +0000
Subject: Re: [PATCH] dmaengine: stm32-mdma: call pm_runtime_put if pm_runtime_get_sync fails
Message-Id: <20200617135940.GU2324254@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <873bfb31-52d8-7c9b-5480-4a94dc945307@web.de>
 <CAEkB2ET_gfNUAuoZHxiGWZX7d3CQaJYJJqS2Fspif5mFq4-xfA@mail.gmail.com>
In-Reply-To: <CAEkB2ET_gfNUAuoZHxiGWZX7d3CQaJYJJqS2Fspif5mFq4-xfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, Alexandre Torgue <alexandre.torgue@st.com>, Dan Williams <dan.j.williams@intel.com>, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 03-06-20, 14:17, Navid Emamdoost wrote:
> On Wed, Jun 3, 2020 at 1:52 PM Markus Elfring <Markus.Elfring@web.de> wrote:
> >
> > > Calling pm_runtime_get_sync increments the counter even in case of
> > > failure, causing incorrect ref count. Call pm_runtime_put if
> > > pm_runtime_get_sync fails.
> >
> > Is it appropriate to copy a sentence from the change description
> > into the patch subject?
> >
> > How do you think about a wording variant like the following?
> Please stop proposing rewording on my patches!
> 
> I will consider updating my patches only if a maintainer asks for it.

Yeah ignore these :) no one takes this 'bot' seriously, it is annoying
yes :(

> >
> >    The PM runtime reference counter is generally incremented by a call of
> >    the function “pm_runtime_get_sync”.
> >    Thus call the function “pm_runtime_put” also in two error cases
> >    to keep the reference counting consistent.
> >
> >
> > Would you like to add the tag “Fixes” to the commit message?
> >
> > Regards,
> > Markus
> 
> 
> 
> -- 
> Navid.

-- 
~Vinod
