From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 08 Oct 2005 20:23:31 +0000
Subject: Re: [KJ] Unreachable Code
Message-Id: <20051008202330.GD24907@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7190652529547974=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051006023754.35718.qmail@web34205.mail.mud.yahoo.com>
In-Reply-To: <20051006023754.35718.qmail@web34205.mail.mud.yahoo.com>
To: kernel-janitors@vger.kernel.org

--===============7190652529547974==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 08, 2005 at 12:42:55PM -0600, Matthew Wilcox wrote:
> On Wed, Oct 05, 2005 at 07:37:54PM -0700, Aaron Grothe wrote:
> > +++ linux-2.6.14-rc3-patch/net/rxrpc/transport.c	2005-10-06 04:45:59.000000000 +0200
> > @@ -563,8 +563,6 @@ void rxrpc_trans_receive_packet(struct r
> >  		kfree_skb(pkt);
> >  	}
> >  
> > -	_leave("");
> > -
> >  } /* end rxrpc_trans_receive_packet() */
> 
> Why delete these?  They seem to be useful:
> 
> #define _leave(FMT, a...)       do { if (rxrpc_ktrace) kleave(FMT , ##a); } while(0)

How can you reach it without break;s from infinite loop?


--===============7190652529547974==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7190652529547974==--
