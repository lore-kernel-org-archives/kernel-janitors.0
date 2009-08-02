From: David Miller <davem@davemloft.net>
Date: Sun, 02 Aug 2009 20:19:21 +0000
Subject: Re: [PATCH 15/15] drivers/ide/ide-cd.c: Use DIV_ROUND_CLOSEST
Message-Id: <20090802.131921.19721973.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908021049350.15557@ask.diku.dk>
	<20090802135122.GA15279@liondog.tnic>
In-Reply-To: <20090802135122.GA15279@liondog.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: petkovbb@googlemail.com
Cc: julia@diku.dk, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Borislav Petkov <petkovbb@googlemail.com>
Date: Sun, 2 Aug 2009 15:51:22 +0200

> On Sun, Aug 02, 2009 at 10:49:54AM +0200, Julia Lawall wrote:
>> From: Julia Lawall <julia@diku.dk>
>> 
>> The kernel.h macro DIV_ROUND_CLOSEST performs the computation (x + d/2)/d
>> but is perhaps more readable.
>> 
 ...
>> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> Acked-by: Borislav Petkov <petkovbb@gmail.com>

Applied to ide-next-2.6, thanks.
