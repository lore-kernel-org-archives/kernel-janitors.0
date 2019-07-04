From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 04 Jul 2019 16:26:20 +0000
Subject: Re: [PATCH][next] drm/amdgpu/psp: fix incorrect logic when checking asic_type
Message-Id: <8f3385e9-4e53-b4b4-11ac-f77ec88bfc64@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190704142329.22983-1-colin.king@canonical.com>
 <5D1E27B4.9000003@bfs.de>
In-Reply-To: <5D1E27B4.9000003@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms@bfs.de
Cc: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/07/2019 17:22, walter harms wrote:
> 
> 
> Am 04.07.2019 16:23, schrieb Colin King:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently the check of the asic_type is always returning true because
>> of the use of ||.  Fix this by using && instead.  Also break overly
>> wide line.
>>
>> Addresses-Coverity: ("Constant expression result")
>> Fixes: dab70ff24db6 ("drm/amdgpu/psp: add psp support for navi14")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/psp_v11_0.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
>> index 527dc371598d..e4afd34e3034 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
>> @@ -540,7 +540,8 @@ psp_v11_0_sram_map(struct amdgpu_device *adev,
>>  
>>  	case AMDGPU_UCODE_ID_RLC_G:
>>  		*sram_offset = 0x2000;
>> -		if (adev->asic_type != CHIP_NAVI10 || adev->asic_type != CHIP_NAVI14) {
>> +		if (adev->asic_type != CHIP_NAVI10 &&
>> +		    adev->asic_type != CHIP_NAVI14) {
>>  			*sram_addr_reg_offset = SOC15_REG_OFFSET(GC, 0, mmRLC_GPM_UCODE_ADDR);
>>  			*sram_data_reg_offset = SOC15_REG_OFFSET(GC, 0, mmRLC_GPM_UCODE_DATA);
>>  		} else {
>> @@ -551,7 +552,8 @@ psp_v11_0_sram_map(struct amdgpu_device *adev,
>>  
>>  	case AMDGPU_UCODE_ID_SDMA0:
>>  		*sram_offset = 0x0;
>> -		if (adev->asic_type != CHIP_NAVI10 || adev->asic_type != CHIP_NAVI14) {
>> +		if (adev->asic_type != CHIP_NAVI10 &&
>> +		    adev->asic_type != CHIP_NAVI14) {
>>  			*sram_addr_reg_offset = SOC15_REG_OFFSET(SDMA0, 0, mmSDMA0_UCODE_ADDR);
>>  			*sram_data_reg_offset = SOC15_REG_OFFSET(SDMA0, 0, mmSDMA0_UCODE_DATA);
>>  		} else {
> 
> 
> maybe it is better to use
> 		if (adev->asic_type = CHIP_NAVI10 ||
> 		    adev->asic_type = CHIP_NAVI14) {
> 
> i guess tha was intended here and it is more easy to read.
> ppl are bad in non-non reading.

I'm not sure what the original intent was now.  Lets see what the folk
at AMD say about this.

> 
> re,
>  wh
> 
