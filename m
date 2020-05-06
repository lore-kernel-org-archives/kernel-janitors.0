From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 06 May 2020 13:08:51 +0000
Subject: Re: [PATCH -next] staging: kpc2000: fix error return code in kp2000_pcie_probe()
Message-Id: <4dd9b3d1-37cf-e016-c14b-02f9e529e611@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506125255.90336-1-weiyongjun1@huawei.com>
 <20200506125723.GL1992@kadam>
In-Reply-To: <20200506125723.GL1992@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, simon@nikanor.nu



On 2020/5/6 20:57, Dan Carpenter wrote:
> On Wed, May 06, 2020 at 12:52:55PM +0000, Wei Yongjun wrote:
>> Fix to return a negative error code from the error handling
>> case instead of 0, as done elsewhere in this function. Also
>> removed var 'rv' since we can use 'err' instead.
>>
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Also could you add a Fixes tag?  This goes all the way back to the
> original commit:
> 
> Fixes: 7dc7967fc39a ("staging: kpc2000: add initial set of Daktronics drivers")
> 

Will fix both of your comments in next version, thanks.

Regards,
Wei Yongjun
