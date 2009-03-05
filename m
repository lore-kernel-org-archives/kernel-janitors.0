From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Date: Thu, 05 Mar 2009 13:47:55 +0000
Subject: Re: [PATCH 04/16 v3] NULL noise: drivers/ide/ide-*.c
Message-Id: <200903051447.55370.bzolnier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090302235343.28697.19909.stgit@f10box.hanneseder.net>
In-Reply-To: <20090302235343.28697.19909.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

On Tuesday 03 March 2009, Hannes Eder wrote:
> Fix this sparse warnings:
>   drivers/ide/ide-disk_proc.c:130:11: warning: Using plain integer as NULL pointer
>   drivers/ide/ide-floppy_proc.c:32:11: warning: Using plain integer as NULL pointer
>   drivers/ide/ide-proc.c:234:11: warning: Using plain integer as NULL pointer
>   drivers/ide/ide-tape.c:2141:11: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

applied
