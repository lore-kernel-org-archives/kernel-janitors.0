From: Stefan Sperling <stefan@binarchy.net>
Date: Tue, 09 Nov 2004 22:21:06 +0000
Subject: Re: [KJ] [PATCH] convert airo wireless driver to module_param
Message-Id: <20041109222106.GA10645@dice.seeling33.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============038158776944479111=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041109212957.GA9496@dice.seeling33.de>
In-Reply-To: <20041109212957.GA9496@dice.seeling33.de>
To: kernel-janitors@vger.kernel.org

--===============038158776944479111==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 09, 2004 at 01:38:18PM -0800, Randy.Dunlap wrote:
> Stefan Sperling wrote:
 
> Rusty's first set of module_param() conversion patches, which
> I mostly followed, use permission (last parameter) of 0
> (not visible in sysfs) except for fields that can be modified.
> Often this is a "debug" or "verbose" flag or bitmask.

Not in this one:

http://marc.theaimsgroup.com/?l=linux-kernel&m=109826168201622&w=2

This is the reference link from the janitors TODO file.
Everything 0444, except a debug flag, which is 0644.

Can someone please clarify the "official guidelines" for
module parameter permissions in sysfs? Shall I use 0 or 0444
for parameters that should not be modified, i.e. everything
except debug and verbosity flags?

thanks
stefan
-- 
Give me a fish and I will eat today.
Teach me to fish and I will eat forever.

--===============038158776944479111==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============038158776944479111==--
