From: Tobias Klauser <tklauser@distanz.ch>
Date: Tue, 17 Aug 2010 16:14:00 +0000
Subject: Re: [PATCH] greth: Use return value of register_netdev
Message-Id: <20100817161400.GE15670@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282061527-19429-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1282061527-19429-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

On 2010-08-17 at 18:12:07 +0200, Tobias Klauser <tklauser@distanz.ch> wrote:
> Use the return value provided by register_netdev on error instead of
> hard setting it to -ENOMEM.

Sorry for the duplicate, please disregard this one.
