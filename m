From: David Miller <davem@davemloft.net>
Date: Mon, 07 Oct 2019 14:01:03 +0000
Subject: Re: [PATCH] net: hns3: make array tick_array static, makes object smaller
Message-Id: <20191007.160103.449489515941198973.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191007110935.32607-1-colin.king@canonical.com>
In-Reply-To: <20191007110935.32607-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, tanhuazhong@huawei.com, linyunsheng@huawei.com, lipeng321@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon,  7 Oct 2019 12:09:35 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array tick_array on the stack but instead make it
> static. Makes the object code smaller by 29 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   19191	    432	      0	  19623	   4ca7	hisilicon/hns3/hns3pf/hclge_tm.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   19098	    496	      0	  19594	   4c8a	hisilicon/hns3/hns3pf/hclge_tm.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
