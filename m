From: Samuel Ortiz <sameo@linux.intel.com>
Date: Thu, 04 Sep 2014 23:03:12 +0000
Subject: Re: [patch -RESEND] NFC: potential overflows in microread_target_discovered()
Message-Id: <20140904230312.GA6702@zurbaran>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140901172729.GA6549@mwanda>
In-Reply-To: <20140901172729.GA6549@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lauro Ramos Venancio <lauro.venancio@openbossa.org>, Eric Lapuyade <eric.lapuyade@linux.intel.com>, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, "John W. Linville" <linville@tuxdriver.com>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, linux-wireless@vger.kernel.org, linux-nfc@ml01.01.org, kernel-janitors@vger.kernel.org, Kees Cook <keescook@chromium.org>

Hi Dan,

On Mon, Sep 01, 2014 at 08:27:29PM +0300, Dan Carpenter wrote:
> Smatch says that skb->data is untrusted so we need to check to make sure
> that the memcpy() doesn't overflow.
Applied to nfc-fixes, thanks.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
