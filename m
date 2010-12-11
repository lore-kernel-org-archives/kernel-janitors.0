From: David Miller <davem@davemloft.net>
Date: Sat, 11 Dec 2010 00:16:08 +0000
Subject: Re: [patch] isdn: return -EFAULT if copy_from_user() fails
Message-Id: <20101210.161608.63015391.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101210124009.GC10623@bicker>
In-Reply-To: <20101210124009.GC10623@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: isdn@linux-pingi.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Fri, 10 Dec 2010 15:40:09 +0300

> We should be returning -EFAULT here.
> 
> Mostly this patch is to silence a smatch warning.  The upper levels
> of this driver turn all non-zero return values from isar_load_firmware()
> into 1.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
