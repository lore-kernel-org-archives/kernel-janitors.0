From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 24 Mar 2018 09:08:34 +0000
Subject: Re: iio/gyro/bmg160_core: Improve unlocking of a mutex in five functions
Message-Id: <7faecfbc-0fea-b262-a81e-578615358081@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <16623de4-351d-135b-f3ff-701a465c5d92@users.sourceforge.net>
 <20180317195422.037a8b57@archlinux>
 <73f0a187-57d1-c877-ba9f-3b15f6a61640@users.sourceforge.net>
 <20180318101506.460f3967@archlinux>
In-Reply-To: <20180318101506.460f3967@archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Pravin Shedge <pravin.shedge4linux@gmail.com>, Quentin Schulz <quentin.schulz@free-electrons.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> The mutex was (and is still only) locked within case branches, isn't it?
>>
> You are correct, this does however reflect the issue with the resulting
> lack of balance here.

Do you find changes for the other function implementations easier to integrate?

Regards,
Markus
