From: Lan Chunhe-B25806 <B25806@freescale.com>
Date: Thu, 28 Oct 2010 11:17:38 +0000
Subject: Re: bug report: signedness issue in ds3232_update_alarm()
Message-Id: <op.vk99noiofud0ec@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101028083503.GZ6062@bicker>
In-Reply-To: <20101028083503.GZ6062@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 28 Oct 2010 18:58:40 +0800, Dan Carpenter <error27@gmail.com>  
wrote:

> On Thu, Oct 28, 2010 at 06:15:46PM +0800, Lan Chunhe-B25806 wrote:
>>       Of course, bcd2bin()/Time is never less than zero. But it is fault
>> tolerant.
>>       When time has exceptional data, it set time to the default value.
>>
>
> Sorry, I still don't understand what you're trying to do.  This showed
> up on my bug scanner, and I've studied it but as far as I can see it
> doesn't do anything.  I've created a sample program to demonstrate what
> I mean.

    If you must not display these message on your bug scanner, you can
    modify code from

    buf[0] = bcd2bin(buf[0]) < 0 || (ds3232->rtc->irq_data & RTC_UF) ?
						0x80 : buf[0];
    to

    buf[0] = (ds3232->rtc->irq_data & RTC_UF) ?
						0x80 : buf[0];

> It passes every possible non-zero value to bcd2bin() and counts how many
> of the returns are negative.
>
> regards,
> dan carpenter
>
> #include <stdio.h>
>
> unsigned bcd2bin(unsigned char val)
> {
>         return (val & 0x0f) + (val >> 4) * 10;
> }
>
> int main(int argc, char **argv)
> {
> 	unsigned char x;
> 	int useful = 0;
>
> 	for (x = 1; x; x++) {
> 		if (bcd2bin(x) < 0)
> 			useful++;
> 	}
>
> 	printf("useful = %d\n", useful);
> 	return 0;
> }
>
    Thanks.

    Jack Lan


