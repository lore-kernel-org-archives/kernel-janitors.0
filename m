From: Julia Lawall <julia@diku.dk>
Date: Sun, 27 Jul 2008 10:13:58 +0000
Subject: Re: [PATCH 1/14 v2] drivers/isdn/hisax/telespci.c: fix warning
Message-Id: <Pine.LNX.4.64.0807271212140.303@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1217145098.6042.2.camel@inlin>
In-Reply-To: <1217145098.6042.2.camel@inlin>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 27 Jul 2008, Michael Borisov wrote:

> 
> > > Probably now it is correct ? 
> > 
> > Please explain why.
> 
> 
> Because added pci_dev_put() and not used assignment in if condition.
> Right ?

The question is whether this is the right time to do pci_dev_put() for 
that value and whether someone will do pci_dev_put(), if needed, for the 
new value.

julia

> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
