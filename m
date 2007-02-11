From: burns.ethan@gmail.com
Date: Sun, 11 Feb 2007 20:34:34 +0000
Subject: Re: [KJ] memory zeroing macros
Message-Id: <20070211203434.GA26874@bender.eaburns.mooo.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702101731480.6852@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702101731480.6852@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Feb 11, 2007 at 04:32:11AM -0500, Robert P. J. Day wrote:
> or maybe this really is just not worth the effort.  who knows?

I don't think its worth the effort.  Changing the name on this wouldn't add
any readability.  memset(dest, 0, len) is very clear, in my opinion.  Also,
there's nothing really error prone about it...  I see no advantage.

	Just my 2 cents,
		--Ethan
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
