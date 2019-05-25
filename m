From: maowenan <maowenan@huawei.com>
Date: Sat, 25 May 2019 06:39:18 +0000
Subject: =?UTF-8?Q?Re:_[PATCH_net]_staging:_Remove_set_but_not_used_variable?= =?UTF-8?B?IOKAmHN0YXR1c+KAmQ==
Message-Id: <68a66947-928c-d2e6-be2b-aa412613f90c@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190525042642.78482-1-maowenan@huawei.com>
 <20190525050113.GB18684@kroah.com>
In-Reply-To: <20190525050113.GB18684@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jeremy@azazel.net, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 2019/5/25 13:01, Greg KH wrote:
> On Sat, May 25, 2019 at 12:26:42PM +0800, Mao Wenan wrote:
>> Fixes gcc '-Wunused-but-set-variable' warning:
>>
>> drivers/staging/kpc2000/kpc_spi/spi_driver.c: In function
>> ‘kp_spi_transfer_one_message’:
>> drivers/staging/kpc2000/kpc_spi/spi_driver.c:282:9: warning: variable
>> ‘status’ set but not used [-Wunused-but-set-variable]
>>      int status = 0;
>>          ^~~~~~
>> The variable 'status' is not used any more, remve it.
>>
>> Signed-off-by: Mao Wenan <maowenan@huawei.com>
>> ---
>>  drivers/staging/kpc2000/kpc_spi/spi_driver.c | 3 ---
>>  1 file changed, 3 deletions(-)
> 
> What is [PATCH net] in the subject for?  This is not a networking driver
> :(
Sorry, this is my mistake.
> 
> 
> .
> 
