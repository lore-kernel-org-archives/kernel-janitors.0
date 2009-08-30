From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 30 Aug 2009 18:26:57 +0000
Subject: Re: [PATCH] drivers/input/keyboard: Move a dereference below a
Message-Id: <20090830185928.613DB526EA5@mailhub.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908301117010.17060@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908301117010.17060@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Aug 30, 2009 at 11:18:13AM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> If the NULL test is necessary, then the dereference should be moved below
> the NULL test.
> 

Applied, thank you Julia.

-- 
Dmitry
