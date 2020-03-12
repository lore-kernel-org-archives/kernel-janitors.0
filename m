From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 12 Mar 2020 12:11:44 +0000
Subject: Re: [PATCH] spi: spi-nxp-fspi: Fix a NULL vs IS_ERR() check in probe
Message-Id: <CAOMZO5CJ7G7yJZEEPfsm1P2SnrJ7kmOPmZCWiKwrvDZjPNOnWw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200312113154.GC20562@mwanda>
In-Reply-To: <20200312113154.GC20562@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Yogesh Gaur <yogeshgaur.83@gmail.com>, Han Xu <han.xu@nxp.com>, Adam Ford <aford173@gmail.com>, Ashish Kumar <ashish.kumar@nxp.com>, Mark Brown <broonie@kernel.org>, linux-spi <linux-spi@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Dan,

On Thu, Mar 12, 2020 at 8:33 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The platform_get_resource_byname() function returns NULL on error, it
> doesn't return error pointers.
>
> Fixes: d166a73503ef ("spi: fspi: dynamically alloc AHB memory")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> The commit message for commit d166a73503ef ("spi: fspi: dynamically
> alloc AHB memory") is not very good.  Why is it necessary to allocate
> the AHB memory dynamically instead of during probe?  Also I suspect that

Agreed and I made the same comment during review:
https://patchwork.kernel.org/patch/11361581/

Thanks
