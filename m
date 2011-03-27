From: Maksym Planeta <mcsim.planeta@gmail.com>
Date: Sun, 27 Mar 2011 08:57:59 +0000
Subject: Re: [PATCH] x86: page: get_order() optimization
Message-Id: <1301216279.15393.9.camel@debian>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1300551947-22279-1-git-send-email-mcsim.planeta@gmail.com>
	 <20110323100757.GA14245@elte.hu>
In-Reply-To: <20110323100757.GA14245@elte.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: tglx@linutronix.de, kernel-janitors@vger.kernel.org, mingo@redhat.com, linux-kernel@vger.kernel.org

On Wed, 23/03/2011 at 11:07 +0100, Ingo Molnar wrote:

> Ok, that's certainly a nice optimization.

Thanks, I rewrote patch according to your observations.

> One detail: in many cases 'size' is a constant. Have you checked recent GCC, 
> does it turn the generic version of get_order() into a loop even for constants, 
> or is it able does it perhaps recognize the pattern and precompute the result?

Yes, gcc precomputes the result, so I added case for constants.

> With no #ifdefs in get_order().

And removed #ifdefs from get_order().

-- 
Thanks,

Maksym Planeta

