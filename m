From: David Miller <davem@davemloft.net>
Date: Tue, 20 Nov 2007 06:50:48 +0000
Subject: Re: [PATCH 1/5] arch/sparc64: Add missing pci_dev_put
Message-Id: <20071119.225048.111848671.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0711190901330.19198@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0711190901330.19198@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Mon, 19 Nov 2007 09:02:22 +0100 (CET)

> From: Julia Lawall <julia@diku.dk>
> 
> There should be a pci_dev_put when breaking out of a loop that iterates
> over calls to pci_get_device and similar functions.
 ..
> Signed-off-by: Julia Lawall <julia@diku.dk>

Patch applied, but something in your email client adds
extra spaces to the second column of several lines in your
your patch.

Please correct this before making future patch submissions.

Thank you.
