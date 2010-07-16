From: David Miller <davem@davemloft.net>
Date: Fri, 16 Jul 2010 02:07:04 +0000
Subject: Re: [PATCH 20/25] mISDN: Convert pci_table entries to PCI_VDEVICE
Message-Id: <20100715.190704.246538713.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201007152104.08458.PeterHuewe@gmx.de>
In-Reply-To: <201007152104.08458.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: PeterHuewe@gmx.de
Cc: kernel-janitors@vger.kernel.org, isdn@linux-pingi.de, akpm@linux-foundation.org, u.kleine-koenig@pengutronix.de, tj@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter H=FCwe <PeterHuewe@gmx.de>
Date: Thu, 15 Jul 2010 21:04:07 +0200

> From: Peter Huewe <peterhuewe@gmx.de>
>=20
> This patch converts pci_table entries, where .subvendor=3DPCI_ANY_ID and
> .subdevice=3DPCI_ANY_ID, .class=3D0 and .class_mask=3D0, to use the
> PCI_VDEVICE macro, and thus improves readability.
>=20
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>

Applied.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
