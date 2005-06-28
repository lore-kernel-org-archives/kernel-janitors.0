From: Domen Puncer <domen@coderock.org>
Date: Tue, 28 Jun 2005 13:32:58 +0000
Subject: Re: [KJ] [PATCH] bonding - a trailing whitespace
Message-Id: <20050628133258.GB3904@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91387688993526739=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050623193023.GF4398@voyager>
In-Reply-To: <20050623193023.GF4398@voyager>
To: kernel-janitors@vger.kernel.org

--===============91387688993526739==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 23/06/05 21:30 +0200, Carlo Perassi wrote:
> A trailing whitespace found making a previuos patch on the same file
> 
> Signed-off-by: Carlo Perassi <carlo@linux.it>
> ---
> +++ linux-2.6.12/drivers/net/bonding/bond_main.c
> @@ -572,7 +572,7 @@
>  static struct proc_dir_entry *bond_proc_dir = NULL;
>  #endif
>  
> -static u32 arp_target[BOND_MAX_ARP_TARGETS] = { 0, } ;
> +static u32 arp_target[BOND_MAX_ARP_TARGETS] = { 0, };

Why not just
	static u32 arp_target[BOND_MAX_ARP_TARGETS];
... and include in the uninitialize static variables patch?

--===============91387688993526739==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91387688993526739==--
