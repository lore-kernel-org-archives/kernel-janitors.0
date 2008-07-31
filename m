From: Jeff Garzik <jgarzik@pobox.com>
Date: Thu, 31 Jul 2008 05:50:25 +0000
Subject: Re: [PATCH] libata.h: replace __FUNCTION__ with __func__
Message-Id: <489152A1.2030400@pobox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <48839ABB.3070503@gmail.com>
In-Reply-To: <48839ABB.3070503@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org

Alexander Beregalov wrote:
> From: Alexander Beregalov <a.beregalov@gmail.com>
> 
> libata.h: replace __FUNCTION__ with __func__
> 
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> 
> ---
> 
>  include/linux/libata.h |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)

applied


