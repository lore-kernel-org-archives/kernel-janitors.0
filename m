From: ebiederm@xmission.com (Eric W. Biederman)
Date: Mon, 27 Aug 2012 00:48:31 +0000
Subject: Re: [userns:userns-always-map-user-v47 30/148] include/net/xfrm.h:730: error: expected declaration s
Message-Id: <87mx1h88io.fsf@xmission.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120823023820.GB5011@localhost>
In-Reply-To: <20120823023820.GB5011@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fengguang Wu <fengguang.wu@intel.com> writes:

> Hi Eric,
>
> FYI, kernel build failed on

Now I understand my confusion.  You reported this failure a week ago
against x86_64 and I fixed this in to userns-always-map-v48.

So I was confused why this failure was coming up again, but given that
you are testing avr32 this makes sense, as it will fail on anything that
hits the correct configuration.

Regardless thank you for all of your diligent effort testing kernel
branches.

Eric
