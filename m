From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 18 Sep 2020 18:03:41 +0000
Subject: Re: [PATCH] scsi: arcmsr: Remove the superfluous break
Message-Id: <51f46436-75f8-441b-861a-ce607daeb09b@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200918093230.49050-1-jingxiangfeng@huawei.com>
 <20200918145619.GA25599@embeddedor>
 <e9320543ab6e7c8bd5ceae8cfa9d0912a0e962e0.camel@perches.com>
 <20200918180037.GY4282@kadam>
In-Reply-To: <20200918180037.GY4282@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Joe Perches <joe@perches.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Jing Xiangfeng <jingxiangfeng@huawei.com>, jejb@linux.ibm.com, martin.petersen@oracle.com, lee.jones@linaro.org, axboe@kernel.dk, mchehab+huawei@kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors <kernel-janitors@vger.kernel.org>

On 18/09/2020 19:00, Dan Carpenter wrote:
> Smatch just ignores these because they're often done deliberately.
> 
> regards,
> dan carpenter
> 

And I ignore fixing them when coverity reports them because life is too
short.

Colin
