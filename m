From: Matthew Wilcox <matthew@wil.cx>
Date: Wed, 29 Sep 2004 22:28:25 +0000
Subject: Re: [Kernel-janitors] Re: [PATCH 2.6.9-rc2-mm4 bttv-driver.c][4/8]
Message-Id: <20040929222825.GK16153@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42719922870242488=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <15470000.1096491322@w-hlinder.beaverton.ibm.com> <20040929220344.A17872@infradead.org> <20040929211135.GA24407@kroah.com> <17920000.1096494218@w-hlinder.beaverton.ibm.com>
In-Reply-To: <17920000.1096494218@w-hlinder.beaverton.ibm.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: Greg KH <greg@kroah.com>, Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, kraxel@bytesex.org

--===============42719922870242488==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 29, 2004 at 02:43:38PM -0700, Hanna Linder wrote:
> +	return(pci_module_init(&bttv_pci_driver));

Why the extra brackets?  I see their use for

	return (a == b);

but

	return pci_module_init(&bttv_pci_driver);

isn't at all ambiguous.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============42719922870242488==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42719922870242488==--
