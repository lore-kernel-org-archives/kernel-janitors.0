From: Stefan Wahren <stefan.wahren@i2se.com>
Date: Mon, 13 May 2019 06:49:15 +0000
Subject: Re: [PATCH] staging: vc04_services: bcm2835-camera: remove redundant assignment to variable ret
Message-Id: <5fd5c89a-4bd0-1d2d-f027-819fe954bd5f@i2se.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190511134813.5645-1-colin.king@canonical.com>
In-Reply-To: <20190511134813.5645-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Eric Anholt <eric@anholt.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11.05.19 15:48, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable ret is being initialized however this is never read and later
> it is being reassigned to a new value. The initialization is redundant and
> hence can be removed.
>
> Addresses-Coverity: ("Unused Value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
