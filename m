From: Hanna Linder <hannal@us.ibm.com>
Date: Mon, 04 Oct 2004 21:48:33 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6] pci-hplj.c: replace
Message-Id: <290370000.1096926512@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============022785250213588348=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <281940000.1096925207@w-hlinder.beaverton.ibm.com> <20041004214107.GA2160@linux-mips.org>
In-Reply-To: <20041004214107.GA2160@linux-mips.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Hanna Linder <hannal@us.ibm.com>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, greg@kroah.com

--===============022785250213588348==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--On Monday, October 04, 2004 11:41:07 PM +0200 Ralf Baechle <ralf@linux-mips.org> wrote:

> On Mon, Oct 04, 2004 at 02:26:47PM -0700, Hanna Linder wrote:
>> If  someone has access to an RM200 or RM300 and could test this I would appreciate it.
> 
> Except that piece of code isn't for an RM[23]00 but a HP Laserjet (yes,
> that paper eating thing ;-) and hasn't seen any update or feedback from
> the original submitters since the original submission, so the entire HPLJ
> code is a candidate for removal ...
> 
>    Ralf

Ahh thanks, the comments at the top of the file confused me:

 * SNI specific PCI support for RM200/RM300.

I have no opinion on the codes deletion or not. I'm simply changing all
occurances of pci_find_device. Hopefully people will not confuse that
work with my having any familiarity with the actual devices themselves :)

Thanks a lot.

Hanna



--===============022785250213588348==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============022785250213588348==--
