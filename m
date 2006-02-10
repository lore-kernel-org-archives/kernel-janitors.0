From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 10 Feb 2006 12:41:53 +0000
Subject: Re: [KJ][Patch] re-send of remove second masking instance of variable
Message-Id: <20060210124153.GB12822@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73942171433909643=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139572879.17620.23.camel@localhost.localdomain>
In-Reply-To: <1139572879.17620.23.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============73942171433909643==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 10, 2006 at 11:01:18PM +1100, Darren Jenkins" wrote:
> This is a re-send of the last patch (that i stuffed up).
> Because there are 3 instances in fpu_trig.c of an extra declaration of a
> variable.

Do you ever compare the code before and after your changes?  I ask
because I don't think gcc does live range splitting yet.  So a variable
which may have been register-allocated before may now move to the stack.
It may often make more sense to rename a variable or manually do LRS.
Examples:

int foo;
if (x) {
	...
}

if (y) {
	int foo;
	...
}

transform either to (a):

if (x) {
	int foo;
	...
}

if (y) {
	int foo;
	...
}

or to (b):

int foo;
if (x) { ... }

if (y) {
	int bar;
	...
}

Option (c) [the one you use] can be better.  If foo is a stack allocated
variable anyway, this will force gcc to use the same stack slot for both.

So I'm not saying these patches are wrong, and I really want to see
shadow variables eliminated (we should always have -Wshadow enabled, IMO).
I'd just like to see some analysis of the consequences of each change.


--===============73942171433909643==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73942171433909643==--
