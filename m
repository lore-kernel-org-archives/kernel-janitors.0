From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 11 Feb 2010 10:03:54 +0000
Subject: Re: bug list: putting too much data on the stack
Message-Id: <E1NfVtq-0002pE-8A@pomaz-ex.szeredi.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100211085120.GF14210@bicker>
In-Reply-To: <20100211085120.GF14210@bicker> (message from Dan Carpenter on
	Thu, 11 Feb 2010 11:51:20 +0300)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Dan,

On Thu, 11 Feb 2010, Dan Carpenter wrote:
> fs/fuse/dev.c +888 fuse_notify_inval_entry(5) warn: 'buf' puts 1025 bytes on stack

The fix for this is already in linux-next.

Thanks,
Miklos
