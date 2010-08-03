From: Jens Axboe <jaxboe@fusionio.com>
Date: Tue, 03 Aug 2010 10:53:06 +0000
Subject: Re: [PATCH] cpqarray: check put_user() result
Message-Id: <4C57F512.5050509@fusionio.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280418885-5630-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280418885-5630-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Chirag Kantharia <chirag.kantharia@hp.com>, Andrew Morton <akpm@linux-foundation.org>, Alexey Dobriyan <adobriyan@gmail.com>, Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>, "iss_storagedev@hp.com" <iss_storagedev@hp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 2010-07-29 17:54, Kulikov Vasiliy wrote:
> put_user() may fail, if so return -EFAULT.

Applied.

-- 
Jens Axboe


Confidentiality Notice: This e-mail message, its contents and any attachments to it are confidential to the intended recipient, and may contain information that is privileged and/or exempt from disclosure under applicable law. If you are not the intended recipient, please immediately notify the sender and destroy the original e-mail message and any attachments (and any copies that may have been made) from your system or otherwise. Any unauthorized use, copying, disclosure or distribution of this information is strictly prohibited.
