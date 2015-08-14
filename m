From: Hartley Sweeten <HartleyS@visionengravers.com>
Date: Fri, 14 Aug 2015 17:40:09 +0000
Subject: RE: [patch] staging: comedi: me4000: use bitwise AND instead of logical
Message-Id: <BN3PR0101MB1057D85984BCD0F1E4D1D0B2D07C0@BN3PR0101MB1057.prod.exchangelabs.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150814085405.GB30728@mwanda>
In-Reply-To: <20150814085405.GB30728@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Friday, August 14, 2015 3:29 AM, Ian Abbott wrote:
> On 14/08/15 09:54, Dan Carpenter wrote:
>> This was supposed to bitwise AND but there is a typo.
>>
>> Fixes: 1a02387063fb ('staging: comedi: me4000: remove 'board' from me4000_ai_insn_read()')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/staging/comedi/drivers/me4000.c b/drivers/staging/comedi/drivers/me4000.c
>> index 5aa1780..15a5320 100644
>> --- a/drivers/staging/comedi/drivers/me4000.c
>> +++ b/drivers/staging/comedi/drivers/me4000.c
>> @@ -480,7 +480,7 @@ static int me4000_ai_insn_read(struct comedi_device *dev,
>>
>>   	entry = chan | ME4000_AI_LIST_RANGE(range);
>>   	if (aref = AREF_DIFF) {
>> -		if (!(s->subdev_flags && SDF_DIFF)) {
>> +		if (!(s->subdev_flags & SDF_DIFF)) {
>>   			dev_err(dev->class_dev,
>>   				"Differential inputs are not available\n");
>>   			return -EINVAL;
>> @@ -559,7 +559,7 @@ static int me4000_ai_check_chanlist(struct comedi_device *dev,
>>   		}
>>
>>   		if (aref = AREF_DIFF) {
>> -			if (!(s->subdev_flags && SDF_DIFF)) {
>> +			if (!(s->subdev_flags & SDF_DIFF)) {
>>   				dev_err(dev->class_dev,
>>   					"Differential inputs are not available\n");
>>   				return -EINVAL;
>>
>
> Thanks for catching that.
>
> Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

Gah... Sorry about that. Thanks for the catch Dan.

Reviewed-by: H Hartley Sweeten <hsweeten@visionengravers.com>

