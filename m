From: Daniele Pizzoni <auouo@tin.it>
Date: Fri, 15 Oct 2004 14:48:25 +0000
Subject: [KJ] janitoring printk with no KERN_ constants, kill all defaults?
Message-Id: <1097855099.3004.64.camel@pdp11.tsho.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============019906096160613229=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: pazke@orbita.don.sitek.net

--===============019906096160613229==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'm investigating this (from the kernel janitors TODO list):

------------------------------------------------------------------------
From: Andrey Panin <pazke at orbita dot don dot sitek dot net>

- check printk() calls (should include appropriate KERN_* constant).

------------------------------------------------------------------------

printk ends up using the default KERN_WARNING constant when no costant
is explicitly specified; the default is changeable. So a printk with
_no_ constant specified means "use the current default" and could be,
maybe in some cases only, a developer choice.

I ask, what rationale there is behind checking all printks to include
the "appropriate" constant? Should then we make printk fail when called
without KERN_ constant? Or can I force with a sed script all defaulted
printk to KERN_WARNING?

I'm looking for advice, or a pointer to an appropriate thread of the
lkml archives.

Thanks
Daniele Pizzoni <auouo@tin.it>



--===============019906096160613229==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============019906096160613229==--
