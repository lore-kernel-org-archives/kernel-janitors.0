From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 May 2020 18:43:06 +0000
Subject: Re: [PATCH -next] bus: mhi: core: Fix some error return code
Message-Id: <20200511184306.GI9365@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200509075654.175002-1-weiyongjun1@huawei.com>
 <20200511103124.GA12753@mani>
 <78d3f7d7be1849138df7dcf9d49177b5@bfs.de>
In-Reply-To: <78d3f7d7be1849138df7dcf9d49177b5@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walter Harms <wharms@bfs.de>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Wei Yongjun <weiyongjun1@huawei.com>, Hemant Kumar <hemantk@codeaurora.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sujeev Dias <sdias@codeaurora.org>, Siddartha Mohanadoss <smohanad@codeaurora.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>

On Mon, May 11, 2020 at 02:26:10PM +0000, Walter Harms wrote:
> Hello guys,
> some nitpicking ...
> the prefered kernalstyle is:
> 
> if (condition)
>    set error_code
>    do something
> 
> from what i can see it is
> 
>  set error_code
>       if (condition)

There isn't a prefered style.  Both are accepted.  Most people have a
personal preference, but there isn't an official preference.

regards,
dan carpenter
