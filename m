From: maximilian attems <janitor@sternwelten.at>
Date: Mon, 05 Jul 2004 13:39:59 +0000
Subject: Re: [Kernel-janitors] Lets update our TODO
Message-Id: <20040705133958.GA1587@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86655060174538412=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============86655060174538412==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, 26 Jun 2004, Domen Puncer wrote:

> Hi.
> 
> It's terrible, please help updating it.
> (It can be a real PITA, when someone new comes, and can't pick any real
>  work from TODO)
> 
> 
> Changes:
> register_reboot_notifier() always returns 0
> skb_alloc doesn't exist
> there is no get_free_pages() (replace it with __get_free_page[s]?())
> init_etherdev() doesn't exist
> ips, ip2main look bogus, ips_detect does not kmalloc anything;
> 
> There's a comment in isapnp/core.c that release_region's were added
> (dated 2001-06-03!).
> proc_register() is now static, used by internal procfs routines.
> 
> loops_per_sec is no more.

great check -> commited.
thx maks


--===============86655060174538412==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86655060174538412==--
