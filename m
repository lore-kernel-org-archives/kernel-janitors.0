From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 15 Oct 2004 16:17:55 +0000
Subject: Re: [KJ] janitoring printk with no KERN_ constants, kill all defaults?
Message-Id: <20041015161755.GB2134@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56654038539843432=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1097855099.3004.64.camel@pdp11.tsho.org>
In-Reply-To: <1097855099.3004.64.camel@pdp11.tsho.org>
To: Daniele Pizzoni <auouo@tin.it>
Cc: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>, pazke@orbita.don.sitek.net

--===============56654038539843432==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 15, 2004 at 05:44:59PM +0200, Daniele Pizzoni wrote:
> I'm investigating this (from the kernel janitors TODO list):

<snip>

> I ask, what rationale there is behind checking all printks to include
> the "appropriate" constant? Should then we make printk fail when called
> without KERN_ constant? Or can I force with a sed script all defaulted
> printk to KERN_WARNING?

I think the rationale is to compare the comments from linux/kernel.h for
the KERN_* definitions to their usage in the code and make sure they
correspond accordingly, e.g. KERN_EMERG is only used if the system is
actually unusable.

Hope that helps,
Nish

--===============56654038539843432==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56654038539843432==--
