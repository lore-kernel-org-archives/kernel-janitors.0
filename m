From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 08 Feb 2021 15:07:33 +0000
Subject: Re: [PATCH] HID: logitech-dj: fix unintentional integer overflow on left shift
Message-Id: <7f79107a-93ad-251d-33bd-9a2cf2748aa9@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210207232120.8885-1-colin.king@canonical.com>
 <20210208150610.GI2696@kadam>
In-Reply-To: <20210208150610.GI2696@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Nestor Lopez Casado <nlopezcasad@logitech.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/02/2021 15:06, Dan Carpenter wrote:
> On Sun, Feb 07, 2021 at 11:21:20PM +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Shifting the integer value 1 is evaluated using 32-bit rithmetic
>> and then used in an expression that expects a 64-bit value, so
>> there is potentially an integer overflow. Fix this by using th
>> BIT_ULL macro to perform the shift and avoid the overflow.
>>
>> Addresses-Coverity: ("Uninitentional integer overflow")
>> Fixes: 534a7b8e10ec ("HID: Add full support for Logitech Unifying receivers")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/hid/hid-logitech-dj.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
>> index 45e7e0bdd382..747f41be0603 100644
>> --- a/drivers/hid/hid-logitech-dj.c
>> +++ b/drivers/hid/hid-logitech-dj.c
>> @@ -1035,7 +1035,7 @@ static void logi_dj_recv_forward_null_report(struct dj_receiver_dev *djrcv_dev,
>>  	memset(reportbuffer, 0, sizeof(reportbuffer));
>>  
>>  	for (i = 0; i < NUMBER_OF_HID_REPORTS; i++) {
>                         ^^^^^^^^^^^^^^^^^^^^^
> This is 32, so it can't be undefined.

Urgh, looks like coverity is being overly pedantic here. :-(

> 
>> -		if (djdev->reports_supported & (1 << i)) {
>> +		if (djdev->reports_supported & BIT_ULL(i)) {
>>  			reportbuffer[0] = i;
>>  			if (hid_input_report(djdev->hdev,
>>  					     HID_INPUT_REPORT,
> 
> regards,
> dan carpenter
> 
