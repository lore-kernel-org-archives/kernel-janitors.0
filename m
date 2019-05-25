From: Greg KH <gregkh@linuxfoundation.org>
Date: Sat, 25 May 2019 05:01:13 +0000
Subject: Re: [PATCH net] staging: =?utf-8?Q?Remove_?= =?utf-8?Q?set_but_not_used_variable_=E2=80=98status=E2=
Message-Id: <20190525050113.GB18684@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190525042642.78482-1-maowenan@huawei.com>
In-Reply-To: <20190525042642.78482-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Mao Wenan <maowenan@huawei.com>
Cc: jeremy@azazel.net, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, May 25, 2019 at 12:26:42PM +0800, Mao Wenan wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/staging/kpc2000/kpc_spi/spi_driver.c: In function
> ‘kp_spi_transfer_one_message’:
> drivers/staging/kpc2000/kpc_spi/spi_driver.c:282:9: warning: variable
> ‘status’ set but not used [-Wunused-but-set-variable]
>      int status = 0;
>          ^~~~~~
> The variable 'status' is not used any more, remve it.
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/staging/kpc2000/kpc_spi/spi_driver.c | 3 ---
>  1 file changed, 3 deletions(-)

What is [PATCH net] in the subject for?  This is not a networking driver
:(
