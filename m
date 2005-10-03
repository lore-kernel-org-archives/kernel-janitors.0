From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 03 Oct 2005 18:27:52 +0000
Subject: Re: [KJ] [PATCH] Stallion serial board sti()/cli() removal
Message-Id: <20051003182752.GB20557@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20026062797981536=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051003175147.GA15354@masoud.ir>
In-Reply-To: <20051003175147.GA15354@masoud.ir>
To: kernel-janitors@vger.kernel.org

--===============20026062797981536==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 03, 2005 at 01:51:48PM -0400, Masoud Sharbiani wrote:
> Hello, 
> I've removed all references to old cli/sti method on stallion serial driver.
> Please review and commit if necessary.
> cheers, 
> Masoud
> PS: This is my first janitorial task. The patch below should apply cleanly to 2.6.14-rc2 or later.

The latest in a long line of patches which do the automated search and
replace which doesn't work.  Isn't there an explanation of why this
doesn't work attached to the todo list?


--===============20026062797981536==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20026062797981536==--
