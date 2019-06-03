From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Jun 2019 10:51:01 +0000
Subject: Re: [PATCH] thermal: mmio: remove some dead code
Message-Id: <20190603105101.GH31203@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190515093420.GC3409@mwanda>
 <87257cd4-a7c8-3531-1033-84a6f79e6588@amazon.com>
 <20190603020901.GA7918@localhost.localdomain>
In-Reply-To: <20190603020901.GA7918@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eduardo Valentin <edubezval@gmail.com>
Cc: "Shenhar, Talel" <talel@amazon.com>, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Jun 02, 2019 at 07:09:03PM -0700, Eduardo Valentin wrote:
> hey Dan, Talel,
> 
> On Mon, May 20, 2019 at 05:26:51PM +0300, Shenhar, Talel wrote:
> > 
> > On 5/15/2019 12:34 PM, Dan Carpenter wrote:
> > >The platform_get_resource() function doesn't return error pointers, it
> > >returns NULL.  The way this is normally done, is that we pass the NULL
> > >resource to devm_ioremap_resource() and then check for errors from that.
> > >See the comment in front of devm_ioremap_resource() for more details.
> > >
> > >Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Acked-by: Talel Shenhar <talel@amazon.com>
> 
> Cool. I will be collecting this. The only change I will do while
> applying this is that the subject will look like this:
> "thermal: thermal_mmio: remove some dead code"
> 
> Just to match the file / driver name.
> 

I feel like it's duplicative to have "thermal" twice, but whatever.
What I normally do is I copy-and-paste what other people use because the
prefered format varies from subsystem to subsystem.  Here the only
previous patch was:

71aa3693493d thermal: Introduce Amazon's Annapurna Labs Thermal Driver

This format was obviously even worse...

I'm often the first person to send a patch for new drivers.  It used to
be common for people to not use a correct patch prefix for the patch
which adds a driver.  But what happened was people got annoyed with the
prefixes I chose.  And I was like, "Nah.  Forget about it.  I got here
first and I claim this land for my ownself.  Be grateful I didn't choose
a snide or rude patch prefix because that's my authority as a prefix
chooser."

regards,
dan carpenter
