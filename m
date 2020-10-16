From: Diana Craciun OSS <diana.craciun@oss.nxp.com>
Date: Fri, 16 Oct 2020 09:26:52 +0000
Subject: Re: [PATCH] vfio/fsl-mc: fix the return of the uninitialized variable ret
Message-Id: <65c7ffdb-fa92-102d-d7d1-29bb7d39fcb7@oss.nxp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201015122226.485911-1-colin.king@canonical.com>
 <20201015125211.3ff46dc1@w520.home>
In-Reply-To: <20201015125211.3ff46dc1@w520.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Williamson <alex.williamson@redhat.com>, Colin King <colin.king@canonical.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Eric Auger <eric.auger@redhat.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/15/2020 9:52 PM, Alex Williamson wrote:
> On Thu, 15 Oct 2020 13:22:26 +0100
> Colin King <colin.king@canonical.com> wrote:
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently the success path in function vfio_fsl_mc_reflck_attach is
>> returning an uninitialized value in variable ret. Fix this by setting
>> this to zero to indicate success.
>>
>> Addresses-Coverity: ("Uninitialized scalar variable")
>> Fixes: f2ba7e8c947b ("vfio/fsl-mc: Added lock support in preparation for interrupt handling")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>   drivers/vfio/fsl-mc/vfio_fsl_mc.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
>> index 80fc7f4ed343..42a5decb78d1 100644
>> --- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
>> +++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
>> @@ -84,6 +84,7 @@ static int vfio_fsl_mc_reflck_attach(struct vfio_fsl_mc_device *vdev)
>>   		vfio_fsl_mc_reflck_get(cont_vdev->reflck);
>>   		vdev->reflck = cont_vdev->reflck;
>>   		vfio_device_put(device);
>> +		ret = 0;
>>   	}
>>   
>>   unlock:
> 
> Looks correct to me, unless Diana would rather set the initial value to
> zero instead.  Thanks,
> 
> Alex
> 


I prefer to initialize the variable to 0 when it's defined. I'll send a 
patch for it.

Thanks,
Diana
