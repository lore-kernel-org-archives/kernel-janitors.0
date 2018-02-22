From: Phil Reid <preid@electromag.com.au>
Date: Thu, 22 Feb 2018 08:11:29 +0000
Subject: Re: [PATCH v2] iio:dummy: Replace S_IWUSR by 0200
Message-Id: <6d7692ef-0929-7ef2-a1c5-989593f02b1c@electromag.com.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180221192807.qfyhp7z27f6r6p47@smtp.gmail.com>
 <alpine.DEB.2.20.1802212101160.2292@hadrien>
In-Reply-To: <alpine.DEB.2.20.1802212101160.2292@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, daniel.baluta@nxp.com, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 22/02/2018 04:01, Julia Lawall wrote:
> 
> On Wed, 21 Feb 2018, Rodrigo Siqueira wrote:
> 
>> This patch fixes the checkpatch.pl warning:
>>
>> drivers/iio/dummy/iio_dummy_evgen.c:151: WARNING: Symbolic permissions
>> 'S_IWUSR' are not preferred. Consider using octal permissions '0200'.
> I haven't studied up on it in great detail, but isn't there a more
> specific macro that doesn't need a permission argument at all?
> 

Probably thinking of IIO_DEVICE_ATTR_RO / IIO_DEVICE_ATTR_WO
But they don't provide flexibility for the show / store method.

-- 
Regards
Phil Reid

