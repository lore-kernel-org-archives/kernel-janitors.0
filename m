From: Elie Morisse <syniurge@gmail.com>
Date: Thu, 30 Apr 2020 19:43:24 +0000
Subject: Re: [PATCH v2] i2c: i2c-amd-mp2-pci: Fix Oops in amd_mp2_pci_init() error handling
Message-Id: <CAC_JBqo4x0KBdb3j3VFrZu5sG2Mfx3xpbDzFk68h3TU99ZVj3Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAC_JBqofuyRiSmK0mFqVLaY=5k9MYmjGaVmggx2dn_YjN8VOmw@mail.gmail.com>
 <20190910134242.GA6620@mwanda> <20200430141050.GB3355@ninjato>
In-Reply-To: <20200430141050.GB3355@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Nehal Shah <nehal-bakulchandra.shah@amd.com>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

Yes I'm still here to review patches.

Sorry about this one, I replied to the v1 but in HTML so it bounced
back the ML and should have but didn't give my ack to the v2. I'll
make sure to give proper feedback to the latest versions of the
patches for the I2C MP2 driver in the future.

Elie

Le jeu. 30 avr. 2020 à 11:10, Wolfram Sang <wsa@the-dreams.de> a écrit :
>
> On Tue, Sep 10, 2019 at 04:42:42PM +0300, Dan Carpenter wrote:
> > The problem is that we dereference "privdata->pci_dev" when we print
> > the error messages in amd_mp2_pci_init():
> >
> >       dev_err(ndev_dev(privdata), "Failed to enable MP2 PCI device\n");
> >               ^^^^^^^^^^^^^^^^^
> >
> > Fixes: 529766e0a011 ("i2c: Add drivers for the AMD PCIe MP2 I2C controller")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Applied to for-current, thanks!
>
> Elie, Nehal, Shyam, are you still there to review patches for this
> driver?
>
