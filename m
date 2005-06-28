From: Domen Puncer <domen@coderock.org>
Date: Tue, 28 Jun 2005 13:56:44 +0000
Subject: Re: [KJ] [PATCH] bonding - a trailing whitespace
Message-Id: <20050628135644.GD3904@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61906626976150458=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050623193023.GF4398@voyager>
In-Reply-To: <20050623193023.GF4398@voyager>
To: kernel-janitors@vger.kernel.org

--===============61906626976150458==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 28/06/05 15:47 +0200, Carlo Perassi wrote:
> > Why not just
> > 	static u32 arp_target[BOND_MAX_ARP_TARGETS];
> > ... and include in the uninitialize static variables patch?
> 
> it is already included in
> [PATCH] [RESEND] bonding - uninitialize static variables

Jup, just noticed, sorry.
(Note to self: read mails from bottom up)

--===============61906626976150458==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61906626976150458==--
