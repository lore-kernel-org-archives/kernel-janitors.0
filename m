From: Matthew Wilcox <matthew@wil.cx>
Date: Sat, 08 Oct 2005 18:42:55 +0000
Subject: Re: [KJ] Unreachable Code
Message-Id: <20051008184255.GA12886@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85610481735388211=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051006023754.35718.qmail@web34205.mail.mud.yahoo.com>
In-Reply-To: <20051006023754.35718.qmail@web34205.mail.mud.yahoo.com>
To: kernel-janitors@vger.kernel.org

--===============85610481735388211==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 05, 2005 at 07:37:54PM -0700, Aaron Grothe wrote:
> +++ linux-2.6.14-rc3-patch/net/rxrpc/transport.c	2005-10-06 04:45:59.000000000 +0200
> @@ -563,8 +563,6 @@ void rxrpc_trans_receive_packet(struct r
>  		kfree_skb(pkt);
>  	}
>  
> -	_leave("");
> -
>  } /* end rxrpc_trans_receive_packet() */

Why delete these?  They seem to be useful:

#define _leave(FMT, a...)       do { if (rxrpc_ktrace) kleave(FMT , ##a); } while(0)


--===============85610481735388211==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85610481735388211==--
