From: Dave Jones <davej@redhat.com>
Date: Fri, 15 Oct 2004 15:46:58 +0000
Subject: [KJ] Re: janitoring printk with no KERN_ constants,
Message-Id: <20041015154658.GD23638@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47552460359016191=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1097855099.3004.64.camel@pdp11.tsho.org>
In-Reply-To: <1097855099.3004.64.camel@pdp11.tsho.org>
To: Daniele Pizzoni <auouo@tin.it>
Cc: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>, pazke@orbita.don.sitek.net

--===============47552460359016191==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 15, 2004 at 05:44:59PM +0200, Daniele Pizzoni wrote:

 > I ask, what rationale there is behind checking all printks to include
 > the "appropriate" constant? Should then we make printk fail when called
 > without KERN_ constant? Or can I force with a sed script all defaulted
 > printk to KERN_WARNING?

No. Consider this..

	printk (KERN_INFO "blah blah ");
	if (foo)
		printk ("%s", stringptr);
	else
		printk ("%d", number);
	printk ("\n");

There's nothing wrong with any of those printk's, so you
cannot do the checks you mention above.

		Dave


--===============47552460359016191==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47552460359016191==--
