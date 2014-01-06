From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 06 Jan 2014 11:49:02 +0000
Subject: Re: [PATCH 1/3] mfd: sta2x11-mfd: use named constants for pci_power_t values
Message-Id: <20140106114902.GB30156@lee--X1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1388706031-22180-1-git-send-email-Julia.Lawall@lip6.fr>
 <1388706031-22180-2-git-send-email-Julia.Lawall@lip6.fr>
 <20140106110145.GM23772@lee--X1>
 <alpine.DEB.2.10.1401061215560.2079@hadrien>
In-Reply-To: <alpine.DEB.2.10.1401061215560.2079@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Samuel Ortiz <sameo@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> > > From: Julia Lawall <Julia.Lawall@lip6.fr>
> > >
> > > The semantic patch that makes this change is as follows:
> > > (http://coccinelle.lip6.fr/)
> > >
> > > // <smpl>
> > > @@
> > > expression pdev;
> > > @@
> > >
> > > pci_set_power_state(pdev,
> > > - 0
> > > + PCI_D0
> > >  )
> > > // </smpl>
> >
> > I'm happy with the code and that you used Coccinelle to discover the
> > issue, but I feel a little more explanation would be helpful to
> > readers.
> >
> > Why is (pci_power_t __force) 0 better than 0?
>=20
> I wasn't particularly attached to the cast, and I don't know if it is an
> issue.  But in trying to understand the code, I found PCI_D0 more
> understandable than 0.

Well I don't want to waste any of your or my time, so I'll apply the
patch and add something along those lines to the commit message.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
