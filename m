From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 08 Jul 2009 06:51:05 +0000
Subject: Re: [PATCH 2/5] drivers/input: Use resource_size
Message-Id: <20090708065105.GB3309@dtor-d630.eng.vmware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907050835530.27464@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907050835530.27464@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Jul 05, 2009 at 08:36:22AM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Use the function resource_size, which reduces the chance of introducing
> off-by-one errors in calculating the resource size.
> 

Applied, thank you Julia.

-- 
Dmitry
