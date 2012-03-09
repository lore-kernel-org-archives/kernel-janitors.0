From: Gustavo Padovan <padovan@profusion.mobi>
Date: Fri, 09 Mar 2012 12:45:19 +0000
Subject: Re: Resend: [PATCH] Bluetooth: Fix Endian Bug.
Message-Id: <20120309124512.GF16366@joana>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330622196-12967-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1330622196-12967-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santosh nayak <santoshprasadnayak@gmail.com>
Cc: marcel@holtmann.org, davem@davemloft.net, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Andrei,

* santosh nayak <santoshprasadnayak@gmail.com> [2012-03-01 22:46:36 +0530]:

> From: Santosh Nayak <santoshprasadnayak@gmail.com>
> 
> Fix network to host endian conversion for L2CAP chan id.
> 
> Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
> ---
>  net/bluetooth/l2cap_sock.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)

Applied, thanks.

	Gustavo
