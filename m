From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 05 Oct 2005 12:18:22 +0000
Subject: [KJ] Re: [PATCH] eth1394: fix gfp flags type
Message-Id: <20051005121822.GA803@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96520971947812417=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============96520971947812417==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 04, 2005 at 08:09:05PM -0700, Randy.Dunlap wrote:
>  static int ether1394_tx (struct sk_buff *skb, struct net_device *dev)
>  {
> -	int kmflags = in_interrupt() ? GFP_ATOMIC : GFP_KERNEL;
> +	unsigned int __nocast kmflags =
> +				in_interrupt() ? GFP_ATOMIC : GFP_KERNEL;

From Matthew Wilcox:

	This construct is bad and needs to be removed.  We should
	*know* what context ether1394_tx is being called in.  Just
	leave this one alone so we continue to get a warning until
	someone fixes it properly.


--===============96520971947812417==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96520971947812417==--
