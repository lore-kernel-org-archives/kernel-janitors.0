From: Jiri Kosina <jkosina@suse.cz>
Date: Fri, 15 Feb 2008 12:48:30 +0000
Subject: Re: [PATCH 6/6] drivers/hid: Use DIV_ROUND_UP
Message-Id: <Pine.LNX.4.64.0802151347480.30955@jikos.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0802141616120.1185@pc-041.diku.dk>
In-Reply-To: <Pine.LNX.4.58.0802141616120.1185@pc-041.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 14 Feb 2008, Julia Lawall wrote:

> -			padlen = (len + maxpacket - 1) / maxpacket;
> +			padlen = DIV_ROUND_UP(len, maxpacket);

Applied, thanks.

-- 
Jiri Kosina
