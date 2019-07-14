From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 14 Jul 2019 17:38:52 +0000
Subject: Re: [v5] staging: most: Delete an error message for a failed memory allocation
Message-Id: <1de4f5d4-fc63-9445-c6b9-fbaaf6d7f200@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190714164126.3159-1-iamkeyur96@gmail.com>
 <20190714172708.5067-1-iamkeyur96@gmail.com>
In-Reply-To: <20190714172708.5067-1-iamkeyur96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Keyur Patel <iamkeyur96@gmail.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Suresh Udipi <sudipi@jp.adit-jv.com>, Christian Gromm <christian.gromm@microchip.com>, Colin Ian King <colin.king@canonical.com>, Eugeniu Rosca <erosca@de.adit-jv.com>

> The kfifo_alloc() failure generates enough information and doesn't need
> to be accompanied by another error statement.

I am curious how the acceptance will evolve for this variant of
another different commit description according to a known software
transformation pattern.


> ---
> Changes in v5:

The subsequent listing should usually be split between V2 till V5
for such a patch change log.

Regards,
Markus
