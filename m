From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Sun, 13 Jun 2010 09:08:04 +0000
Subject: Re: [patch] mtd: return success on blktrans_ioctl()
Message-Id: <1276420084.19028.182.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100531140337.GV5483@bicker>
In-Reply-To: <20100531140337.GV5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, kernel-janitors@vger.kernel.org, H Hartley Sweeten <hsweeten@visionengravers.com>, linux-mtd@lists.infradead.org, Ben Hutchings <bhutchings@solarflare.com>, David Woodhouse <dwmw2@infradead.org>

On Mon, 2010-05-31 at 16:03 +0200, Dan Carpenter wrote:
> There was a break missing so we returned -ENOTTY on success instead of
> zero.  This was introduced by 048d8719956: "mtd: blktrans: Hotplug fixes"
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

