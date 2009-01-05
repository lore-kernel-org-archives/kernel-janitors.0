From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Mon, 05 Jan 2009 14:28:41 +0000
Subject: Re: [PATCH 7/7] drivers/usb/serial: Move a dereference below a NULL
Message-Id: <20090105142841.1dc7f32d@lxorguk.ukuu.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812260829000.25450@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812260829000.25450@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: gregkh@suse.de, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 26 Dec 2008 08:29:19 +0100 (CET)
Julia Lawall <julia@diku.dk> wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> If the NULL test is necessary, then the dereference should be moved below
> the NULL test.

Both serial ones reviewed and the NULL test removed entirely
