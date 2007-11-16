From: Grant Grundler <grundler@parisc-linux.org>
Date: Fri, 16 Nov 2007 17:32:48 +0000
Subject: Re: [PATCH] alpha/parisc: Removing config variable DEBUG_RWLOCK
Message-Id: <20071116173248.GB13967@colo.lackof.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <473C065D.1000000@gmail.com>
	<20071115190605.GF20892@colo.lackof.org>
	<alpine.LFD.0.9999.0711151453230.4568@localhost.localdomain>
In-Reply-To: <alpine.LFD.0.9999.0711151453230.4568@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: kernel-janitors@vger.kernel.org, ink@jurassic.park.msu.ru, Andrew Morton <akpm@linux-foundation.org>, parisc-linux@parisc-linux.org, Jiri Olsa <olsajiri@gmail.com>, rth@twiddle.net

On Thu, Nov 15, 2007 at 02:54:45PM -0500, Robert P. J. Day wrote:
...
> > > -# CONFIG_DEBUG_RWLOCK is not set
> > >  # CONFIG_DEBUG_RODATA is not set
> 
> IIRC, you typically don't bother fixing up the defconfig files --
> those will be regenerated eventually.

It's not automatic though. So I don't mind the update.

thanks,
grant
