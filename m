From: Ralf Baechle <ralf@linux-mips.org>
Date: Tue, 05 Oct 2004 13:36:52 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6] pci-hplj.c: replace
Message-Id: <20041005133652.GA17520@linux-mips.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91947087919174697=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <281940000.1096925207@w-hlinder.beaverton.ibm.com> <20041004214107.GA2160@linux-mips.org> <1096981395.30942.859.camel@hades.cambridge.redhat.com>
In-Reply-To: <1096981395.30942.859.camel@hades.cambridge.redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Hanna Linder <hannal@us.ibm.com>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, greg@kroah.com, linux-mips@linux-mips.org

--===============91947087919174697==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 05, 2004 at 02:03:16PM +0100, David Woodhouse wrote:

> On Mon, 2004-10-04 at 23:41 +0200, Ralf Baechle wrote:
> > Except that piece of code isn't for an RM[23]00 but a HP Laserjet (yes,
> > that paper eating thing ;-) and hasn't seen any update or feedback from
> > the original submitters since the original submission, so the entire HPLJ
> > code is a candidate for removal ...
> 
> Any idea precisely what model, and how to get it installed? 
> eBay calls... :)

They only ever published the initial code drop.  No code maintenance since
or any kind of documentation ...  However one of the group of code submitters
back then was claiming to run Gnome with remote X display - probably because
at least back then there was no support for the printing hw and anyway,
the refresh rate of a printer is somewhat limited ;-)

As I recall the code was originally submitted by roger_twede@hp.com.

  Ralf

--===============91947087919174697==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91947087919174697==--
