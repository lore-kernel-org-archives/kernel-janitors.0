From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Date: Tue, 16 Dec 2008 20:49:29 +0000
Subject: Re: [PATCH 1/11] drivers/ide: Move a dereference below a NULL test
Message-Id: <200812162149.30288.bzolnier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812161611280.20444@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812161611280.20444@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tuesday 16 December 2008, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> In each case, if the NULL test is necessary, then the dereference should be
> moved below the NULL test.

applied, thanks!
