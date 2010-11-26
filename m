From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Fri, 26 Nov 2010 16:05:59 +0000
Subject: Re: [PATCH] fs: jffs2: fix error value sign
Message-Id: <1290787559.2552.29.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289765320-6071-1-git-send-email-segoon@openwall.com>
In-Reply-To: <1289765320-6071-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: David Woodhouse <dwmw2@infradead.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org

On Sun, 2010-11-14 at 23:08 +0300, Vasiliy Kulikov wrote:
> do_verify_xattr_datum(), do_load_xattr_datum(), load_xattr_datum()
> and verify_xattr_ref() should return negative value on error.
> Sometimes they return EIO that is positive.  Change this to -EIO.
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

