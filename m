From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 11 Jul 2005 13:58:17 +0000
Subject: Re: [KJ] [PATCH 08/20] Fix "nocast type" warnings
Message-Id: <20050711135817.GC29554@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13557666469791263=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507102319.16053.victor@cetuc.puc-rio.br>
In-Reply-To: <200507102319.16053.victor@cetuc.puc-rio.br>
To: kernel-janitors@vger.kernel.org

--===============13557666469791263==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 10, 2005 at 11:19:15PM +0000, Victor Fusco wrote:
> Description:
>     Fix the sparse warning "implicit cast to nocast type"

>  static int ether1394_tx (struct sk_buff *skb, struct net_device *dev)
>  {
> -	int kmflags = in_interrupt() ? GFP_ATOMIC : GFP_KERNEL;
> +	unsigned int kmflags = in_interrupt() ? GFP_ATOMIC : GFP_KERNEL;
>  	struct eth1394hdr *eth;

This construct is bad and needs to be removed.  We should *know* what
context ether1394_tx is being called in.  Just leave this one alone so
we continue to get a warning until someone fixes it properly.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============13557666469791263==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13557666469791263==--
