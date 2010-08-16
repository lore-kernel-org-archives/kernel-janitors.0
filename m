From: Dan Carpenter <error27@gmail.com>
Date: Mon, 16 Aug 2010 18:13:06 +0000
Subject: Re: [PATCH 15/16] drivers/platform/x86: Use available error codes
Message-Id: <20100816181305.GD645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008161828350.19313@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008161828350.19313@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Aug 16, 2010 at 06:28:52PM +0200, Julia Lawall wrote:
> ---
> This changes the semantics and has not been tested.  In each case, error is
> also assigned to the result of a function call.  Perhpas that should be
> changed to result as well, and error should be eliminated.
> 

Yep.  That should be changed to result as well.

regards,
dan carpenter


