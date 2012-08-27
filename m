From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 27 Aug 2012 03:59:08 +0000
Subject: Re: [userns:userns-always-map-user-v47 30/148] include/net/xfrm.h:730: error: expected declaration s
Message-Id: <20120827035908.GD15084@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120823023820.GB5011@localhost>
In-Reply-To: <20120823023820.GB5011@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Aug 26, 2012 at 05:48:31PM -0700, Eric W. Biederman wrote:
> Fengguang Wu <fengguang.wu@intel.com> writes:
> 
> > Hi Eric,
> >
> > FYI, kernel build failed on
> 
> Now I understand my confusion.  You reported this failure a week ago
> against x86_64 and I fixed this in to userns-always-map-v48.
> 
> So I was confused why this failure was coming up again, but given that
> you are testing avr32 this makes sense, as it will fail on anything that
> hits the correct configuration.

Sorry for the duplicate report! It's definitely a problem the avr32
build was delayed for so long time. I'll take care of this and make
sure that the slowest builds complete within hours.

The another problem is the errors reported by different gcc versions
are sometimes not identical:

new gcc:
include/net/xfrm.h:730:6: error: unknown type name 'kuidt_t'

older gcc:
include/net/xfrm.h:730: error: expected declaration specifiers or '...' before 'kuidt_t'

That makes the build system alert again, and the latter notification
comes so late, that I've forgot all about the previous one, so send it
out again..

> Regardless thank you for all of your diligent effort testing kernel
> branches.

You are welcome.

Thanks,
Fengguang
