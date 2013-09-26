From: Alexander Holler <holler@ahsoftware.de>
Date: Thu, 26 Sep 2013 02:57:32 +0000
Subject: Re: checkpatch guide for newbies
Message-Id: <5243A29C.6080009@ahsoftware.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130923090100.GE6192@mwanda> <CAErSpo5XgvuG=75nExa7yCa7C+Bxhk+1LwruxY8pv2DU+r-_aA@mail.gmail.com> <5241CB44.8080004@ahsoftware.de> <CA+MoWDpnNjeEN+Crzh2kQ7DPJ_DqEOP4z-9n3=EqP7hiPgZRXg@mail.gmail.com> <CAErSpo4X0-PEYtZrY2r4GKmzTJhHK3eKdXrbccJhB7wVkVCYLA@mail.gmail.com> <52420DF1.7060108@ahsoftware.de> <20130926021130.GD13318@ZenIV.linux.org.uk> <5243A165.2060204@ahsoftware.de>
In-Reply-To: <5243A165.2060204@ahsoftware.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Am 26.09.2013 04:52, schrieb Alexander Holler:

> I'm aware of people which do nest 8 levels deep just to avoid a return,
> break or goto.
> 
> But trying to limit that by limiting the line length is like ...
> (choose your own own misguided comparison, it's too late for me I
> currently only meorize some of those which don't make sense in english)

But I'm still able to offer a solution: ;)

limit the number of tabs, not the line length (at least not to 80).

Regards,

Alexander Holler
