From: "Arend van Spriel" <arend@broadcom.com>
Date: Thu, 04 Oct 2012 16:27:48 +0000
Subject: Re: [patch 3/3] brcmfmac: Using zero instead of NULL
Message-Id: <506DB904.9000002@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121003060713.GC3802@elgon.mountain>
In-Reply-To: <20121003060713.GC3802@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Brett Rudley <brudley@broadcom.com>, Roland Vossen <rvossen@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Kan Yan <kanyan@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, Hante Meuleman <meuleman@broadcom.com>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, kernel-janitors@vger.kernel.org

On 10/03/2012 08:07 AM, Dan Carpenter wrote:
> Sparse complains that we use zero instead of NULL here.  In fact, the
> initialization is wrong and should be removed.  Doing these kinds of
> bogus initializations means that GCC can't detect unitialized variables
> and leads to bugs.

We already had it fixed internally, but your change is more sensible. I 
had it reviewed internally and plan to send it to John for 3.8 (ie. 
wireless-next after merge window). Let me know if that is ok with you.

Gr. AvS

