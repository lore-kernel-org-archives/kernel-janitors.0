From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Sep 2020 18:00:37 +0000
Subject: Re: [PATCH] scsi: arcmsr: Remove the superfluous break
Message-Id: <20200918180037.GY4282@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200918093230.49050-1-jingxiangfeng@huawei.com>
 <20200918145619.GA25599@embeddedor>
 <e9320543ab6e7c8bd5ceae8cfa9d0912a0e962e0.camel@perches.com>
In-Reply-To: <e9320543ab6e7c8bd5ceae8cfa9d0912a0e962e0.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Jing Xiangfeng <jingxiangfeng@huawei.com>, jejb@linux.ibm.com, martin.petersen@oracle.com, lee.jones@linaro.org, colin.king@canonical.com, axboe@kernel.dk, mchehab+huawei@kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors <kernel-janitors@vger.kernel.org>

Smatch just ignores these because they're often done deliberately.

regards,
dan carpenter
