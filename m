From: Christoph Hellwig <hch@infradead.org>
Date: Thu, 07 Oct 2004 13:17:31 +0000
Subject: Re: [Kernel-janitors] [PATCH 2.6][1/12] arch/ppc/kernel/pci.c replace
Message-Id: <20041007141731.A11865@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============48525900983699866=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <298570000.1096930681@w-hlinder.beaverton.ibm.com> <20041005104443.A16871@infradead.org> <3550000.1097094201@w-hlinder.beaverton.ibm.com>
In-Reply-To: <3550000.1097094201@w-hlinder.beaverton.ibm.com>; from hannal@us.ibm.com on Wed, Oct 06, 2004 at 01:23:21PM -0700
To: Hanna Linder <hannal@us.ibm.com>
Cc: Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, benh@kernel.crashing.org, paulus@samba.org, greg@kroah.com

--===============48525900983699866==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 06, 2004 at 01:23:21PM -0700, Hanna Linder wrote:
> --On Tuesday, October 05, 2004 10:44:43 AM +0100 Christoph Hellwig <hch@infradead.org> wrote:
> 
> > what about adding a for_each_pci_dev macro that nicely hides these AND_ID
> > iterations?
> > 
> 
> OK. How about this? Following are two patches that I used to test this
> new macro on my T23. I found roughly 54 other places this macro can
> be used.

Looks good to me

---end quoted text---

--===============48525900983699866==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============48525900983699866==--
