From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 30 Sep 2019 06:55:20 +0000
Subject: Re: [PATCH] usb: dwc3: pci: prevent memory leak in dwc3_pci_probe
Message-Id: <5f21ff8b-0cd2-5442-7d8b-f31b0f5dcdfe@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190930024147.25243-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190930024147.25243-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-usb@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> … This commit replaces return with the goto.

How do you think about to omit the wording “This commit” from your change descriptions?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=97f9a3c4eee55b0178b518ae7114a6a53372913d#n151

Regards,
Markus
