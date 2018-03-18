From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Mar 2018 08:19:47 +0000
Subject: Re: iio/gyro/bmg160_core: Improve unlocking of a mutex in five functions
Message-Id: <73f0a187-57d1-c877-ba9f-3b15f6a61640@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <16623de4-351d-135b-f3ff-701a465c5d92@users.sourceforge.net>
 <20180317195422.037a8b57@archlinux>
In-Reply-To: <20180317195422.037a8b57@archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Pravin Shedge <pravin.shedge4linux@gmail.com>, Quentin Schulz <quentin.schulz@free-electrons.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



Am 17.03.2018 um 20:54 schrieb Jonathan Cameron:
> On Wed, 14 Mar 2018 16:15:32 +0100
> SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> 
>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Wed, 14 Mar 2018 16:06:49 +0100
>>
>> * Add jump targets so that a call of the function "mutex_unlock" is stored
>>   only once in these function implementations.
>>
>> * Replace 19 calls by goto statements.
>>
>> This issue was detected by using the Coccinelle software.
>>
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> Hi Markus,
> 
> Some of these are good and sensible changes

Such feedback is nice.


> - others break the code.

Which concrete places do you find questionable here?


>> -		return ret;
>> +
>> +		goto set_power_state;
>>  	default:
>>  		return -EINVAL;
> We exit with the mutex locked now and it should not be.

I wonder about your source code interpretation here.
The mutex was (and is still only) locked within case branches, isn't it?


> 
>>  	}
>>  
>>  	return -EINVAL;
> Mutex is still locked here and the return is wrong.

Should this statement get any more software development attention?

Regards,
Markus
