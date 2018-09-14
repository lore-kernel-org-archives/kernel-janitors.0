From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 14 Sep 2018 12:07:01 +0000
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fix spelling mistake "entires" -> "entries"
Message-Id: <4d9374d2-57aa-1f3c-bc28-c62c87355264@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180914112451.4127-1-colin.king@canonical.com>
 <eea53471-2998-5bad-7187-44430a9bde8c@linaro.org>
In-Reply-To: <eea53471-2998-5bad-7187-44430a9bde8c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Elder <elder@linaro.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 14/09/18 12:43, Alex Elder wrote:
> On 09/14/2018 06:24 AM, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Trivial fix to spelling mistake
> 
> I hate to have two-character fixes to documentation like this.  I.e.,
> as long as you're touching the README file it might have been nice to
> review it and look for other things.  I suspect you found this in the
> program output though, and also noticed it in the README file.

Indeed, it was the program output where the mistake was first spotted.

> 
> So...  Looks good to me.
> 
> Reviewed-by: Alex Elder <elder@linaro.org>
> 
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/staging/greybus/tools/README.loopback | 2 +-
>>  drivers/staging/greybus/tools/loopback_test.c | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/greybus/tools/README.loopback b/drivers/staging/greybus/tools/README.loopback
>> index 845b08dc4696..070a510cbe7c 100644
>> --- a/drivers/staging/greybus/tools/README.loopback
>> +++ b/drivers/staging/greybus/tools/README.loopback
>> @@ -79,7 +79,7 @@ Here is the summary of the available options:
>>     -t     must be one of the test names - sink, transfer or ping
>>     -i     iteration count - the number of iterations to run the test over
>>   Optional arguments
>> -   -S     sysfs location - location for greybus 'endo' entires default /sys/bus/greybus/devices/
>> +   -S     sysfs location - location for greybus 'endo' entries default /sys/bus/greybus/devices/
>>     -D     debugfs location - location for loopback debugfs entries default /sys/kernel/debug/gb_loopback/
>>     -s     size of data packet to send during test - defaults to zero
>>     -m     mask - a bit mask of connections to include example: -m 8 = 4th connection -m 9 = 1st and 4th connection etc
>> diff --git a/drivers/staging/greybus/tools/loopback_test.c b/drivers/staging/greybus/tools/loopback_test.c
>> index b82e2befe935..2fa88092514d 100644
>> --- a/drivers/staging/greybus/tools/loopback_test.c
>> +++ b/drivers/staging/greybus/tools/loopback_test.c
>> @@ -192,7 +192,7 @@ void usage(void)
>>  	"   -t     must be one of the test names - sink, transfer or ping\n"
>>  	"   -i     iteration count - the number of iterations to run the test over\n"
>>  	" Optional arguments\n"
>> -	"   -S     sysfs location - location for greybus 'endo' entires default /sys/bus/greybus/devices/\n"
>> +	"   -S     sysfs location - location for greybus 'endo' entries default /sys/bus/greybus/devices/\n"
>>  	"   -D     debugfs location - location for loopback debugfs entries default /sys/kernel/debug/gb_loopback/\n"
>>  	"   -s     size of data packet to send during test - defaults to zero\n"
>>  	"   -m     mask - a bit mask of connections to include example: -m 8 = 4th connection -m 9 = 1st and 4th connection etc\n"
>>
> 
