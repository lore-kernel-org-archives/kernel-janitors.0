From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Date: Mon, 14 May 2018 10:58:12 +0000
Subject: Re: [PATCH 1/2] tpm: replace kmalloc() + memcpy() with kmemdup()
Message-Id: <20180514105812.GG8228@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20180509001258epcas1p4e8db163d8babd90284dd6afb6a96eb0f@epcas1p4.samsung.com>
 <1525824757-21835-1-git-send-email-ji_hun.kim@samsung.com>
In-Reply-To: <1525824757-21835-1-git-send-email-ji_hun.kim@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ji-Hun Kim <ji_hun.kim@samsung.com>
Cc: peterhuewe@gmx.de, tweek@google.com, jgg@ziepe.ca, arnd@arndb.de, gregkh@linuxfoundation.org, javierm@redhat.com, sonnyrao@chromium.org, enric.balletbo@collabora.com, linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 09, 2018 at 09:12:36AM +0900, Ji-Hun Kim wrote:
> Use kmemdup rather than duplicating its implementation.
> 
> Signed-off-by: Ji-Hun Kim <ji_hun.kim@samsung.com>

Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

/Jarkko
