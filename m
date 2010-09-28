From: Jarod Wilson <jarod@redhat.com>
Date: Tue, 28 Sep 2010 19:01:26 +0000
Subject: Re: [PATCH] staging: crystalhd: fix signed bug
Message-Id: <20100928190126.GG8726@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284317813-4895-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1284317813-4895-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Manu Abraham <abraham.manu@gmail.com>, Scott Davilla <davilla@4pi.com>, Lars Lindley <lindley@coyote.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Sun, Sep 12, 2010 at 10:56:51PM +0400, Vasiliy Kulikov wrote:
> chd_dec_major is unsigned, so check chd_dec_major < 0 doesn't make sense.
> Since it is used as signed, declare it as int.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Indeed, Bad Things here when we try to store the ret from register_chrdev
in an unsigned int and test it for < 0...

Acked-by: Jarod Wilson <jarod@redhat.com>

-- 
Jarod Wilson
jarod@redhat.com

