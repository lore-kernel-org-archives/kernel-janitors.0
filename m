From: Jonathan Corbet <corbet@lwn.net>
Date: Tue, 22 Jan 2013 14:20:00 +0000
Subject: Re: [PATCH 04/24] use IS_ENABLED() macro
Message-Id: <20130122072000.15efd64c@lwn.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358613206-4274-1-git-send-email-peter.senna@gmail.com>
	<1358613206-4274-4-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1358613206-4274-4-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: mchehab@redhat.com, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 19 Jan 2013 14:33:07 -0200
Peter Senna Tschudin <peter.senna@gmail.com> wrote:

> replace:
>  #if defined(CONFIG_VIDEOBUF2_VMALLOC) || \
>      defined(CONFIG_VIDEOBUF2_VMALLOC_MODULE)
> with:
>  #if IS_ENABLED(CONFIG_VIDEOBUF2_VMALLOC)
> 
> This change was made for: CONFIG_VIDEOBUF2_VMALLOC,
> CONFIG_VIDEOBUF2_DMA_CONTIG, CONFIG_VIDEOBUF2_DMA_SG

That's something I'd meant to do to this driver for a while, thanks.

Acked-by: Jonathan Corbet <corbet@lwn.net>

jon
