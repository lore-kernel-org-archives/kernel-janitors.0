From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 24 Jul 2012 02:59:11 +0000
Subject: Re: [uapi:uapi-split 25/74] arch/ia64/include/asm/bitops.h:47:1: error: macro "__paravirt_getreg" pa
Message-Id: <20120724025911.GA6503@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <23199.1342949300@warthog.procyon.org.uk>
In-Reply-To: <23199.1342949300@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jul 24, 2012 at 05:55:54AM +0800, Luck, Tony wrote:
> > Is it worth marking config PARAVIRT dependent on !IA64 so that
> > allyes/modconfig builds work?
> 
> Sounds like a good idea to me. It will save people time discovering how broken this is.

I have the same feeling, let's do that.  Sorry for the noises!

Thanks,
Fengguang
