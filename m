From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 14 Feb 2005 15:10:44 +0000
Subject: Re: [KJ] [PATCH] drivers/char/watchdog/* : pci_request_regions
Message-Id: <20050214151044.GE29917@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60068247091451488=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050214150111.GH20620@rhum.iomeda.fr>
In-Reply-To: <20050214150111.GH20620@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============60068247091451488==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 04:01:11PM +0100, Christophe Lucas wrote:

Please pay attention to CodingStyle.

> +	int pci_dev_busy = 0 ;

No space before the ;

> +		pci_dev_busy = 1 ;

Ditto.

> +	if(!pci_dev_busy)

Should be a space between if and (

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============60068247091451488==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60068247091451488==--
