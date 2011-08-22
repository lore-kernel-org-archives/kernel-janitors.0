From: Heiko Carstens <heiko.carstens@de.ibm.com>
Date: Mon, 22 Aug 2011 12:27:32 +0000
Subject: Re: [PATCH] arch/s390/kernel/ipl.c: correct error detection check
Message-Id: <20110822122732.GA9280@osiris.boeblingen.de.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1314013594-25651-1-git-send-email-julia@diku.dk>
In-Reply-To: <1314013594-25651-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, kernel-janitors@vger.kernel.org, linux390@de.ibm.com, Michael Holzheu <holzheu@linux.vnet.ibm.com>, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, sumsaha@gmail.com

On Mon, Aug 22, 2011 at 01:46:34PM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> reipl_fcp_kset was just initialized, so it appears that it should be tested
> instead of reipl_kset.
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> Reported-by: Suman Saha <sumsaha@gmail.com>

Applied. Thanks!
