From: David Miller <davem@davemloft.net>
Date: Thu, 12 Jul 2018 05:54:50 +0000
Subject: Re: [PATCH] wimax/i2400m: remove redundant variables ack_status, bcf and protocol
Message-Id: <20180711.225450.1331664103278085758.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180709122313.14483-1-colin.king@canonical.com>
In-Reply-To: <20180709122313.14483-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: inaky.perez-gonzalez@intel.com, linux-wimax@intel.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon,  9 Jul 2018 13:23:13 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variables ack_status, bcf and protocol are being assigned but are
> never used hence they are redundant and can be removed.
> 
> Also declare ack_type as unsigned int rather than unsigned to clean
> up a checkpatch warning.
> 
> Cleans up clang warnings:
> warning: variable 'ack_status' set but not used [-Wunused-but-set-variable]
> warning: variable 'bcf' set but not used [-Wunused-but-set-variable]
> warning: variable 'protocol' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

This is simple enough that I'll just apply this directly, thanks
Colin.
