From: Dave Jones <davej@redhat.com>
Date: Tue, 08 Feb 2005 01:02:34 +0000
Subject: Re: [KJ] updated kj-devel.pl
Message-Id: <20050208010233.GB6853@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27636484044698406=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502041215.01436.vicente.feito@gmail.com>
In-Reply-To: <200502041215.01436.vicente.feito@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============27636484044698406==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 07, 2005 at 04:46:58PM -0800, Randy.Dunlap wrote:

 > spinlock misuse detection is often not straightforward.
 > E.g., in kernel/acct.c (2.6.11-rc3), I'm getting:
 > Lock closed on line 115
 > Lock closed on line 162
 > Obtained spinlock on line 198, but never unlocked.
 > acct.c:198:             spin_lock(&acct_globals.lock);
 > 
 > 
 > Lock closed on line 247
 > Lock closed on line 263
 > Lock closed on line 521
 > ^^^^^^^^^^^^^^ these line numbers appear to be off by 1 line.
 > ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You're probably best off throwing away the spinlock detection code.
Its horrible, and breaks really easily.  I'm almost
embarressed to admit to writing it.

Sparse should be able to do a much better job.

		Dave



--===============27636484044698406==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27636484044698406==--
