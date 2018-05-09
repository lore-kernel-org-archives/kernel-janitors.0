From: James Morris <jmorris@namei.org>
Date: Wed, 09 May 2018 19:16:57 +0000
Subject: Re: [PATCH 2/2] tpm: replace kmalloc() + memcpy() with kmemdup()
Message-Id: <alpine.LRH.2.21.1805100516480.12749@namei.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1525824757-21835-1-git-send-email-ji_hun.kim@samsung.com>        <CGME20180509001300epcas2p3971900d48408aef6a80f59b9480aac16@epcas2p3.samsung.com> <1525824757-21835-2-git-send-email-ji_hun.kim@samsung.com>
In-Reply-To: <1525824757-21835-2-git-send-email-ji_hun.kim@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ji-Hun Kim <ji_hun.kim@samsung.com>
Cc: peterhuewe@gmx.de, tweek@google.com, jarkko.sakkinen@linux.intel.com, jgg@ziepe.ca, arnd@arndb.de, gregkh@linuxfoundation.org, javierm@redhat.com, sonnyrao@chromium.org, enric.balletbo@collabora.com, linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 9 May 2018, Ji-Hun Kim wrote:

> Use kmemdup rather than duplicating its implementation.
> 
> Signed-off-by: Ji-Hun Kim <ji_hun.kim@samsung.com>


Reviewed-by: James Morris <james.morris@microsoft.com>


-- 
James Morris
<jmorris@namei.org>

