From: Trilok Soni <tsoni@codeaurora.org>
Date: Sun, 11 Mar 2012 19:50:22 +0000
Subject: Re: [patch] [media] gpio-ir-recv: a couple signedness bugs
Message-Id: <4F5D01C5.4090101@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120310085818.GC4647@elgon.mountain>
In-Reply-To: <20120310085818.GC4647@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Ravi Kumar V <kumarrav@codeaurora.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-arm-msm@vger.kernel.org

Hi Dan,

On 3/10/2012 2:28 PM, Dan Carpenter wrote:
> There are couple places where we check unsigned values for negative.  I
> changed ->gpin_nr to signed because in gpio_ir_recv_probe() we do:
>          if (pdata->gpio_nr<  0)
>                  return -EINVAL;
> I also change gval to a signed int in gpio_ir_recv_irq() because that's
> the type that gpio_get_value_cansleep() returns and we test for negative
> returns.
>
> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>
>

Thanks.

Reviewed-by: Trilok Soni <tsoni@codeaurora.org>

---Trilok Soni

--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
