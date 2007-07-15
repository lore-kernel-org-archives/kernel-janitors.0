From: Christoph Hellwig <hch@infradead.org>
Date: Sun, 15 Jul 2007 09:20:01 +0000
Subject: Re: [PATCH 1/2] run scripts/Lindent on it to match Documentation/CodingStyle
Message-Id: <20070715092001.GB15790@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1184489571313-git-send-email-crquan@gmail.com>
In-Reply-To: <1184489571313-git-send-email-crquan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Cheng <crquan@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jul 15, 2007 at 04:52:50PM +0800, Denis Cheng wrote:
> -	return ((char *) NULL);
> +	return ((char *)NULL);

casting NULL to another pointer type is dumb to start with.  Please replace
this line with

	return NULL;

