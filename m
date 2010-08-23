From: Jarod Wilson <jarod@redhat.com>
Date: Mon, 23 Aug 2010 17:47:55 +0000
Subject: Re: [PATCH 12/18 v2] staging: crystalhd: call disable_pci_device()
Message-Id: <20100823174755.GG28475@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281383506-14438-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1281383506-14438-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Manu Abraham <abraham.manu@gmail.com>, Scott Davilla <davilla@4pi.com>, Arnd Bergmann <arnd@arndb.de>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Mon, Aug 09, 2010 at 11:51:44PM +0400, Kulikov Vasiliy wrote:
> Driver should call disable_pci_device() if it returns from pci_probe()
> with error.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Looks fine by me.

Acked-by: Jarod Wilson <jarod@redhat.com>

-- 
Jarod Wilson
jarod@redhat.com

