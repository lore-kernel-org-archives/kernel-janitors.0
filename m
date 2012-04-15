From: David Miller <davem@davemloft.net>
Date: Sun, 15 Apr 2012 04:21:25 +0000
Subject: Re: [PATCH] isdn/hysdn: Convert to kstrtoul_from_user
Message-Id: <20120415.002125.1245643666941498950.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1334446979-1177-1-git-send-email-peterhuewe@gmx.de>
In-Reply-To: <1334446979-1177-1-git-send-email-peterhuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: peterhuewe@gmx.de
Cc: isdn@linux-pingi.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>
Date: Sun, 15 Apr 2012 01:42:59 +0200

> This patch replaces the code for getting an number from a
> userspace buffer by a simple call to kstroul_from_user.
> This makes it easier to read and less error prone.
> 
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>

Applied to net-next, thanks a lot.
