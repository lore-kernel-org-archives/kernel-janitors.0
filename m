From: Arjan van de Ven <arjan@infradead.org>
Date: Sun, 09 Nov 2008 17:14:27 +0000
Subject: Re: [PATCH 3/8] drivers/media: use ARRAY_SIZE
Message-Id: <20081109091427.1d6bdfcd@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0811091754410.32509@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0811091754410.32509@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: mchehab@infradead.org, v4l-dvb-maintainer@linuxtv.org, video4linux-list@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 9 Nov 2008 17:55:03 +0100 (CET)
Julia Lawall <julia@diku.dk> wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> ARRAY_SIZE is more concise to use when the size of an array is
> divided by the size of its type or the size of its first element.

Hi,
looking at your patch, I don't think I agree it's just blindly the
right thing to do.

> -	*count = sizeof(RegAddr) / sizeof(u8);
> +	*count = ARRAY_SIZE(RegAddr);

really. ARRAY_SIZE doesn't appear to be an improvement here..


-- 
Arjan van de Ven 	Intel Open Source Technology Centre
For development, discussion and tips for power savings, 
visit http://www.lesswatts.org
