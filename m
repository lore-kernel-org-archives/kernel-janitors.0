From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Oct 2012 08:46:22 +0000
Subject: Re: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:363:64: sparse: incorrect type in argument 3 (differe
Message-Id: <20121002084622.GS4587@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120928163653.GC5171@localhost>
 <8A71B368A89016469F72CD08050AD3340C527934@maui.asicdesigners.com>
In-Reply-To: <8A71B368A89016469F72CD08050AD3340C527934@maui.asicdesigners.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jay Hernandez <jay@chelsio.com>
Cc: Fengguang Wu <fengguang.wu@intel.com>, Vipul Pandya <vipul@chelsio.com>, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

On Mon, Oct 01, 2012 at 05:48:55PM -0700, Jay Hernandez wrote:
> Hi Fengguang,
> 
> Thanks for pointing this out we have a fix which addresses these issues.
> What's interesting is I did not see these warnings I tried to reproduce
> the errors on my setup. Is there a special flag we can use to reproduce
> the sparse warnings.
> 

Yup.

http://lwn.net/Articles/205624/

regards,
dan carpenter

