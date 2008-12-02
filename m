From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Date: Tue, 02 Dec 2008 19:29:32 +0000
Subject: Re: [PATCH] alim15x3: fix sparse warning
Message-Id: <200812022029.35785.bzolnier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <493049e1.0ab6660a.0bc3.ffffaf3b@mx.google.com>
In-Reply-To: <493049e1.0ab6660a.0bc3.ffffaf3b@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org

On Thursday 27 November 2008, Hannes Eder wrote:
> Fix this sparse warning:
> 
>   drivers/ide/alim15x3.c:594:2: warning: returning void-valued expression
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

applied
