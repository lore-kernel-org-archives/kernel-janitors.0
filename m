From: Vasiliy Kulikov <segoon@openwall.com>
Date: Fri, 19 Nov 2010 19:17:05 +0000
Subject: Re: [PATCH] drivers: base: core: do not put noninitialized devices
Message-Id: <20101119191705.GA12558@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290192100-11451-1-git-send-email-segoon@openwall.com>
 <20101119190242.GA14328@suse.de>
 <20101119191424.GA12273@albatros>
In-Reply-To: <20101119191424.GA12273@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@suse.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 19, 2010 at 22:14 +0300, Vasiliy Kulikov wrote:
> No, I've just analized the code.  Without device_initialize() ->kobj is
> not initialized:

I mean 'not set' instead of 'not initialized' - it is already kzalloc()'ed :)


Thanks,

-- 
Vasiliy Kulikov
http://www.openwall.com - bringing security into open computing environments
