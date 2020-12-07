From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 07 Dec 2020 18:34:26 +0000
Subject: Re: [PATCH] media: i2c: ov02a10: fix an uninitialized return
Message-Id: <20201207183426.GY2767@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X84nbdgv0a/ak2ef@mwanda>
In-Reply-To: <X84nbdgv0a/ak2ef@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Dec 07, 2020 at 05:56:15PM +0200, Andy Shevchenko wrote:
> +Cc: some people who involved in different kernel source checkers
> 
> On Mon, Dec 7, 2020 at 3:19 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> > On Mon, Dec 07, 2020 at 04:00:29PM +0300, Dan Carpenter wrote:
> > > The "ret" variable isn't set on the no-op path where we are setting to
> > > on/off and it's in the on or off state already.
> > >
> > > Fixes: 91807efbe8ec ("media: i2c: add OV02A10 image sensor driver")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > Thanks for the patch.
> >
> > This issue has been fixed by another patch here:
> >
> > <URL:https://patchwork.linuxtv.org/project/linux-media/patch/20201204082037.1658297-1-arnd@kernel.org/>
> 
> This has been reported by 3 or 4 different people. I'm wondering if
> it's possible to introduce a common database to somehow reduce the
> amount of patches against the same findings.

Tell your devs to stop introducing bugs...  :P  This is your punishment.

Linus turned off GCC warnings for uninitialized variables earlier this
year.  He got annoyed because it doesn't work half the time depending on
the version and optimization level.  I sort of disagree with that,
because I reporting these bugs is taking up a lot of my time.  It has
definitely gotten worse from my perspective.

The best solution would be for the original developer to run Smatch on
their code.  Another option would be to make a script where you give it
a function name and it searches patches within the last week on
lore.kernel.org

regards,
dan carpenter
