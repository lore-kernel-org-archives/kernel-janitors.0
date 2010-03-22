From: Joe Perches <joe@perches.com>
Date: Mon, 22 Mar 2010 15:43:47 +0000
Subject: Re: [patch v2] cx231xx: card->driver "Conexant cx231xx Audio" too
Message-Id: <1269272627.22616.35.camel@Joe-Laptop.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100319114957.GQ5331@bicker> <s5hr5ncxvm9.wl%tiwai@suse.de>
	 <20100322153909.GC23411@bicker>
In-Reply-To: <20100322153909.GC23411@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, Mauro Carvalho Chehab <mchehab@infradead.org>, Srinivasa Deevi <srinivasa.deevi@conexant.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2010-03-22 at 18:39 +0300, Dan Carpenter wrote:
> card->driver is 15 characters and a NULL, the original code could 
> cause a buffer overflow.

> In version 2, I used a better name that Takashi Iwai suggested.

Perhaps it's better to use strncpy as well.


