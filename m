From: Stefan Wahren <stefan.wahren@i2se.com>
Date: Wed, 11 Sep 2019 14:17:25 +0000
Subject: Re: [PATCH] staging: vhciq_core: replace snprintf with scnprintf
Message-Id: <7bf3c74d-e690-1ef1-dd74-ac98667e42ef@i2se.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190911135112.GA5569@SARKAR>
In-Reply-To: <20190911135112.GA5569@SARKAR>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rohit Sarkar <rohitsarkar5398@gmail.com>, Eric Anholt <eric@anholt.net>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, =?UTF-8?Q?Tobias_B=c3=bcttner?= <tobias.buettner@fau.de>, linux-rpi-kernel@lists.infradead.org, Dominic Braun <inf.braun@fau.de>

Hi Rohit,

On 11.09.19 15:51, Rohit Sarkar wrote:
> When the number of bytes to be printed exceeds the limit snprintf
> returns the number of bytes that would have been printed (if there was
> no truncation). This might cause issues, hence use scnprintf which
> returns the actual number of bytes printed to buffer always
>
> Signed-off-by: Rohit Sarkar <rohitsarkar5398@gmail.com>
thanks for your patch. Did you test your change on the Raspberry Pi?
