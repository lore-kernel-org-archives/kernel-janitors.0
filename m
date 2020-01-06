From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Mon, 06 Jan 2020 16:06:06 +0000
Subject: Re: [PATCH] usb: ohci-da8xx: ensure error return on variable error is set
Message-Id: <2c3b944c-6d31-ec50-234b-c203460ea06a@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200106130609.51174-1-colin.king@canonical.com>
In-Reply-To: <20200106130609.51174-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 01/06/2020 04:06 PM, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when an error in da8xx_ohci->oc_gpi occurs causes an

   s/gpi/gpio/. And you missed a noun between 2 verbs.

> uninitialized error value in variable 'error' to be returned. 
> Fix this by ensuring the error variable is set to the error value
> in da8xx_ohci->oc_gpi.

   oc_gpio again.

> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: d193abf1c913 ("usb: ohci-da8xx: add vbus and overcurrent gpios")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
[...]

MBR, Sergei
