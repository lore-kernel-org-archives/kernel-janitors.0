Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7178E6AD6
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Nov 2023 05:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 89CBAFA;
	Sun,  5 Nov 2023 21:50:42 -0800 (PST)
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id E3FB8602A9F16;
	Mon,  6 Nov 2023 13:50:09 +0800 (CST)
Message-ID: <26575f23-2ccb-98b8-df85-af829460ffd1@nfschina.com>
Date: Mon, 6 Nov 2023 13:50:09 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] HID: wacom_sys: add error code check in
 wacom_feature_mapping
Content-Language: en-US
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: ping.cheng@wacom.com, jason.gerecke@wacom.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <871qd31qkx.fsf@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/11/6 11:57, Rahul Rameshbabu wrote:
> On Fri, 20 Oct, 2023 17:02:38 +0800 "Su Hui" <suhui@nfschina.com> wrote:
>> hid_report_raw_event() can return error code like '-ENOMEM' if
>> failed, so check 'ret' to make sure all things work fine.
> I can agree with adding logging for error cases personally.
>
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>>   drivers/hid/wacom_sys.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
>> index 3f704b8072e8..1f898d4ee708 100644
>> --- a/drivers/hid/wacom_sys.c
>> +++ b/drivers/hid/wacom_sys.c
>> @@ -320,6 +320,8 @@ static void wacom_feature_mapping(struct hid_device *hdev,
>>   			if (ret == n && features->type == HID_GENERIC) {
>>   				ret = hid_report_raw_event(hdev,
>>   					HID_FEATURE_REPORT, data, n, 0);
>> +				if (ret)
>> +					hid_warn(hdev, "failed to report feature\n");
> I think we should report the returned error information as well.
Agreed, I will send v2 soon.
Thanks for your suggestions!

Su Hui

>
>    https://docs.kernel.org/core-api/printk-formats.html#error-pointers
>
> Typically what I do is use ERR_PTR in tandem with the %pe modifier for
> printing errors.
>
>>   			} else if (ret == 2 && features->type != HID_GENERIC) {
>>   				features->touch_max = data[1];
>>   			} else {
>> @@ -381,6 +383,8 @@ static void wacom_feature_mapping(struct hid_device *hdev,
>>   		if (ret == n) {
>>   			ret = hid_report_raw_event(hdev, HID_FEATURE_REPORT,
>>   						   data, n, 0);
>> +			if (ret)
>> +				hid_warn(hdev, "failed to report feature\n");
>>   		} else {
>>   			hid_warn(hdev, "%s: could not retrieve sensor offsets\n",
>>   				 __func__);
> --
> Thanks for the patch,
>
> Rahul Rameshbabu
>
