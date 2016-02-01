From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Mon, 01 Feb 2016 04:53:42 +0000
Subject: Re: wireless-drivers: random cleanup patches piling up
Message-Id: <20160201044142.GC4072@sudip-pc>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87wpr3x9ln.fsf@kamboji.qca.qualcomm.com>
 <1453423965.3856.22.camel@perches.com>
 <87k2n1x0sf.fsf@kamboji.qca.qualcomm.com>
 <20160122151211.GB1500@tuxdriver.com>
 <87si1pvcd7.fsf@kamboji.qca.qualcomm.com>
 <20160126052823.GA2053@sudip-laptop>
 <87bn84kdu0.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87bn84kdu0.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: "John W. Linville" <linville@tuxdriver.com>, Joe Perches <joe@perches.com>, linux-wireless@vger.kernel.org, kbuild test robot <lkp@intel.com>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Jan 29, 2016 at 10:08:23AM +0200, Kalle Valo wrote:
> Sudip Mukherjee <sudipm.mukherjee@gmail.com> writes:
> 
> >> >> That's also my experience from maintaining wireless-drivers for a year,
> >> >> this seems to be a "hit and run" type of phenomenon.
> >> >
> >> > Should we be looking for someone to run a "wireless-driver-cleanups"
> >> > tree?  They could handle the cleanups and trivial stuff, and send
> >> > you a pull request a couple of times per release...?
> >> 
> >> Not a bad idea! But I don't think we need a separate tree as applying
> >> patches from patchwork is easy. It should be doable that we add an
> >> account to patchwork and whenever I see a this type of trivial cleanup
> >> patch I'll assign it to the cleanup maintainer and whenever he/she
> >> thinks it's ready he assigns the patch back to me and I'll apply it.
> >> 
> >> The only difficult part is finding a victim/volunteer to
> >> do that ;)
> >
> > I can be a volunteer (victim?). Though i donot know much about
> > wireless-drivers, but I do know a little about cleanup patches.
> > And maybe, in the process I will start knowing wireless-drivers.
> 
> I think it's better that you have prior experience with linux-wireless
> before doing something like this. You can start by reviewing patches and
> providing Reviewed-by tags.

Sure, I am starting that way. I checked in patchwork and I do not see
any checkpatch related patch pending (except staging, which Greg will
handle). I think you must have cleared all of them.

regards
sudip
