From: David Howells <dhowells@redhat.com>
Date: Thu, 27 Nov 2008 15:05:52 +0000
Subject: Re: [PATCH] arch/frv/kernel/sys_frv.c: add missing fput
Message-Id: <9512.1227798352@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0811271524340.15160@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0811271524340.15160@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: dhowells@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall <julia@diku.dk> wrote:

> -	if (pgoff & ((1<<(PAGE_SHIFT-12))-1))
> -		return -EINVAL;
> +	if (pgoff & ((1<<(PAGE_SHIFT-12))-1)) {
> +		error = -EINVAL;
> +		goto out_file;
> +	}

There's a better way to fix this.  The check on pgoff should be done before
fget() is called.

David
