From: Stefan Sperling <stefan@binarchy.net>
Date: Tue, 09 Nov 2004 22:56:09 +0000
Subject: Re: [KJ] [PATCH] convert airo wireless driver to module_param
Message-Id: <20041109225609.GA11279@dice.seeling33.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27956091790552562=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041109212957.GA9496@dice.seeling33.de>
In-Reply-To: <20041109212957.GA9496@dice.seeling33.de>
To: kernel-janitors@vger.kernel.org

--===============27956091790552562==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 09, 2004 at 02:29:07PM -0800, Randy.Dunlap wrote:
> >I'll try again and make everything invisible except debug/verbosity flags.
> >Since you mentioned bitmasks, is it safe to make irq bitmasks writable as 
> >well?
> >I made them read-only.
> 
> I mentioned bitmasks because some debug variables aren't boolean,
> they are bit flags, or sometimes they are an integer (debug level).

Oops, I misread that one, sorry.
I only found IRQ bitmasks among the parameters, thus I mixed that up...

> No, I don't think that irq bitmasks should be writeable.
> Having any system reource data writeable (like IRQ) is asking for
> trouble IMO.

no way! ;-)

thanks
stefan
-- 
Give me a fish and I will eat today.
Teach me to fish and I will eat forever.

--===============27956091790552562==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27956091790552562==--
