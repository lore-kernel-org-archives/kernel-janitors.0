From: Marcel Holtmann <marcel@holtmann.org>
Date: Wed, 04 Mar 2020 12:47:43 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to 6lowpan doc ReST conversion
Message-Id: <D2D045E0-180D-4F76-93D5-735A5600E62B@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200304104717.5841-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200304104717.5841-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, Stefan Schmidt <stefan@datenfreihafen.org>, Bluez mailing list <linux-bluetooth@vger.kernel.org>, Alexander Aring <alex.aring@gmail.com>, Jukka Rissanen <jukka.rissanen@linux.intel.com>, linux-wpan@vger.kernel.org, linux-fsdevel@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Lukas,

> Commit 107db7ec7838 ("docs: networking: convert 6lowpan.txt to ReST")
> renamed 6lowpan.txt to 6lowpan.rst for the ReST conversion.
> 
> Since then, ./scripts/get_maintainer.pl --self-test complains:
> 
>  warning: no file matches F: Documentation/networking/6lowpan.txt
> 
> Adjust 6LOWPAN GENERIC (BTLE/IEEE 802.15.4) entry in MAINTAINERS.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Mauro, please ack.
> Marcel, please pick for bluetooth-next.
> 
> MAINTAINERS | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
