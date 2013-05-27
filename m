From: Gerald Schaefer <gerald.schaefer@de.ibm.com>
Date: Mon, 27 May 2013 16:23:06 +0000
Subject: Re: [PATCH v2] arch: s390: appldata: using strncpy() and strnlen() instead of sprintf()
Message-Id: <20130527182306.3bd8a252@thinkpad>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51A2CC07.5010100@asianux.com>
	<CAMuHMdXTW3QOxfAfqQXdbSpP4R83srFf7eMfu5fA-75S_Mujsg@mail.gmail.com>
	<51A32D81.2010105@asianux.com>
In-Reply-To: <51A32D81.2010105@asianux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chen Gang <gang.chen@asianux.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux390@de.ibm.com, linux-s390@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, 27 May 2013 17:55:13 +0800
Chen Gang <gang.chen@asianux.com> wrote:

> 
> 'buf[2]' is 2 bytes length, and sprintf() will append '\0' at the end
> of string "?\n", so original implementation is memory overflow.
> 
> Need use strncpy() and strnlen() instead of sprintf().
> 
> 
> Signed-off-by: Chen Gang <gang.chen@asianux.com>

Applied, thanks.

