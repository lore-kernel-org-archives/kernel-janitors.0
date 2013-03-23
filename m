From: David Miller <davem@davemloft.net>
Date: Sat, 23 Mar 2013 23:56:51 +0000
Subject: Re: [PATCH] bnx2x: fix assignment of signed expression to unsigned variable
Message-Id: <20130323.195651.2270136988020869155.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1364064775-19319-1-git-send-email-gmate.amit@gmail.com>
In-Reply-To: <1364064775-19319-1-git-send-email-gmate.amit@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gmate.amit@gmail.com
Cc: eilong@broadcom.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Sat, 23 Mar 2013 11:52:55 -0700

> fix for incorrect assignment of signed expression to unsigned variable.
> 
> Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>

Returning positive error codes is just as broken as what is there
currently.

These routines should return 0 or 1, the return value isn't even used
in any way, it is just tested against zero.
