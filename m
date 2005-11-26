From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 26 Nov 2005 21:20:00 +0000
Subject: [KJ] FYI: unused #define's
Message-Id: <20051126212000.GA31360@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4121842216617666=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============4121842216617666==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

While browsing Mozilla CVS some time ago, I've noticed that LXR doesn't
hyperlink #defines which were unused (refcnt = 1). So, the trick is
too feed kernel to a a-la LXR script, then quickly browse HTML in
include/linux/ include/asm-*/ ...

Those who want to try this at home, might want to use gtags, which is
GNU GLOBAL source code tag system. Install it, then do:

	cd linux-latest
	gtags
		[watch South Park, eat pizza, ...]
	htags
		[watch more South Park, eat more pizza,	...]

It takes ~1.5 hours and ~1Gb of disk space here to build tags database and
HTML file for every source file. You'll get HTML/ directory which you
can mv(1) as long as you want; it's self-contained.

Now, now! Unused #define's are not highlighted. I guess we should
eventually get rid of them. The tricky part is ## abuse and possible
bugs in gtags, so usual rules re compile-test, grep(1) apply.

This is not call for patches, just FYI.

P.S.: Yes, Mozilla Janitors project will have nice future.
      292M of C/C++ code. ;-)


--===============4121842216617666==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4121842216617666==--
