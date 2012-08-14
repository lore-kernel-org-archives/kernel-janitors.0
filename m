From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Tue, 14 Aug 2012 10:45:20 +0000
Subject: Re: [patch] Staging: xgifb: fix bitwise vs logical bug
Message-Id: <201208141245.21045.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120814070445.GF4791@elgon.mountain>
In-Reply-To: <20120814070445.GF4791@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Am Dienstag, 14. August 2012, 09:04:45 schrieb Dan Carpenter:
> This is a static checker fix and not something I can test.  The intent
> of the code here is to set some bit flags.  For a logical OR the ">> 1"
> shift wouldn't make a difference.  So it should be using a bitwise OR.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
I guess this is correct.

Reviewed-by: Peter Huewe <peterhuewe@gmx.de>
