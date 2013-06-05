From: John Stultz <john.stultz@linaro.org>
Date: Wed, 05 Jun 2013 00:25:17 +0000
Subject: Re: [patch] staging: alarm-dev: information leak in alarm_compat_ioctl()
Message-Id: <51AE856D.7040407@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130603090231.GB16171@debian>
In-Reply-To: <20130603090231.GB16171@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 06/04/2013 05:07 PM, Arve Hj=F8nnev=E5g wrote:
> On Tue, Jun 4, 2013 at 6:13 AM, Dan Carpenter <dan.carpenter@oracle.com> =
wrote:
>> If we pass an invalid clock type then "ts" is never set.  We need to
>> check for errors earlier, otherwise we end up passing uninitialized
>> stack data to userspace.
>>
>> Reported-by: John Stultz <john.stultz@linaro.org>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/staging/android/alarm-dev.c b/drivers/staging/andro=
id/alarm-dev.c
>> index c8600d9..6dc27da 100644
>> --- a/drivers/staging/android/alarm-dev.c
>> +++ b/drivers/staging/android/alarm-dev.c
>> @@ -297,6 +297,8 @@ static long alarm_compat_ioctl(struct file *file, un=
signed int cmd,
>>          }
>>
>>          rv =3D alarm_do_ioctl(file, cmd, &ts);
>> +       if (rv)
>> +               return rv;
>>
>>          switch (ANDROID_ALARM_BASE_CMD(cmd)) {
>>          case ANDROID_ALARM_GET_TIME(0): /* NOTE: we modified cmd above =
*/
>> @@ -305,7 +307,7 @@ static long alarm_compat_ioctl(struct file *file, un=
signed int cmd,
>>                  break;
>>          }
>>
>> -       return rv;
>> +       return 0;
>>   }
>>   #endif
>>
> Is there a separate fix for alarm_ioctl? It seems to have the same proble=
m.
Yea, I CC'ed the kernel-team alias yesterday on Dan's original fix for=20
the alarm_ioctl, which Greg has already queued.

This is just the follow-on fix to catch the same issue (as you also=20
noted) in the compat_ioctl.

thanks
-john

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
