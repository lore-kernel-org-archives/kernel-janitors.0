From: Stefan Sperling <stefan@binarchy.net>
Date: Tue, 09 Nov 2004 22:05:09 +0000
Subject: Re: [KJ] [PATCH] convert airo wireless driver to module_param
Message-Id: <20041109220509.GA10211@dice.seeling33.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26612272852420693=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041109212957.GA9496@dice.seeling33.de>
In-Reply-To: <20041109212957.GA9496@dice.seeling33.de>
To: kernel-janitors@vger.kernel.org

--===============26612272852420693==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 09, 2004 at 01:38:18PM -0800, Randy.Dunlap wrote:
> Why make these writable, even by root?
> Why make them visible?
> 
> Rusty's first set of module_param() conversion patches, which
> I mostly followed, use permission (last parameter) of 0
> (not visible in sysfs) except for fields that can be modified.
> Often this is a "debug" or "verbose" flag or bitmask.
> 
> Many of these shouldn't be exposed in sysfs IMO.

OK, I wasn't too sure about permissions anyway.
I thought the general idea was to allow autoconfiguration through sysfs,
and expose a driver's internal state to diagnostic tools in user space.
So I only 0444'd parameters that should obviously not be changed at runtime,
such as IO ports and IRQs.

I'll try again and make everything invisible except debug/verbosity flags.
Since you mentioned bitmasks, is it safe to make irq bitmasks writable as well?
I made them read-only.

thanks
stefan
-- 
Give me a fish and I will eat today.
Teach me to fish and I will eat forever.

--===============26612272852420693==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26612272852420693==--
