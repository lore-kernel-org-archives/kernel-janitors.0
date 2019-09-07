From: David Miller <davem@davemloft.net>
Date: Sat, 07 Sep 2019 16:03:24 +0000
Subject: Re: [PATCH] net: hns3: make array spec_opcode static const, makes object smaller
Message-Id: <20190907.180324.2086722384944546511.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190906112804.7812-1-colin.king@canonical.com>
In-Reply-To: <20190906112804.7812-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, lipeng321@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri,  6 Sep 2019 12:28:04 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array spec_opcode on the stack but instead make it
> static const. Makes the object code smaller by 48 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>    6914	   1040	    128	   8082	   1f92	hns3/hns3vf/hclgevf_cmd.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>    6866	   1040	    128	   8034	   1f62	hns3/hns3vf/hclgevf_cmd.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
