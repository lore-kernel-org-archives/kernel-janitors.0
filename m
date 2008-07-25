From: "Darrick J. Wong" <djwong@us.ibm.com>
Date: Fri, 25 Jul 2008 16:42:54 +0000
Subject: Re: [PATCH 2/5] drivers/scsi/aic94xx/: replace __FUNCTION__ with
Message-Id: <20080725164253.GA7355@tree.beaverton.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1216954114-31949-1-git-send-email-crquan@gmail.com>
In-Reply-To: <1216954114-31949-1-git-send-email-crquan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis ChengRq <crquan@gmail.com>
Cc: linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jul 25, 2008 at 10:48:33AM +0800, Denis ChengRq wrote:
> Signed-off-by: Denis ChengRq <crquan@gmail.com>

No justification or changelog?

> -		__FUNCTION__)
> +		__func__)

include/linux/kernel.h:503:#define __FUNCTION__ (__func__)

I assume you're trying to kill this?

--D
