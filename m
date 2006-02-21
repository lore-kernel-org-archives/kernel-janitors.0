From: "=?ISO-8859-1?Q?H=E5kon_L=F8vdal?=" <hlovdal@gmail.com>
Date: Tue, 21 Feb 2006 23:51:17 +0000
Subject: Re: [KJ] gcc4 warnings, variable used uninitialized
Message-Id: <a01a16b50602211551s7bf6dc83j9c2d9bb84c0e675a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140524267.2600.9.camel@omega.sp.or.at>
In-Reply-To: <1140524267.2600.9.camel@omega.sp.or.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 2/21/06, Dave Jones <davej@redhat.com> wrote:
>  > <snip>
>  > void get_agp_version(struct agp_bridge_data *bridge)
>  > {
>  >      u32 ncapid;
>  >
>  >      /* Exit early if already set by errata workarounds. */
>  >      if (bridge->major_version !=3D 0)
>  >              return;
>  >
>  >      pci_read_config_dword(bridge->dev, bridge->capndx, &ncapid);
>  > [...]
>  > </snip>
>
> gcc bug.  It doesn't seem to understand that sometimes ptrs to vars get
> passed to functions that instantiate them.
>
> There are dozens and dozens of such instances in the kernel tree.
> 99% of the time that warning is completely bogus.

I would not call it a bug. The problem is that gcc does not know if the
third argument of pci_read_config_dword is used as an in parameter or
out parameter.

If the pointer is used as an in parameter, then the code above is wrong
and pci_read_config_dword will read some random memory (which gcc rightly
should warn about). If the pointer only is used as out parameter then
there is no problem but since gcc cannot tell, it issues a warning in
any case. Because of that the warning will most likely give many
false alarms and be quite unuseful, but it is not wrong I think.

BR H=E5kon L=F8vdal

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
