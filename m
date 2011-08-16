From: Dan Carpenter <error27@gmail.com>
Date: Tue, 16 Aug 2011 15:04:52 +0000
Subject: Re: [PATCH] tty: clearify structure initializer in notify_write()
Message-Id: <20110816150452.GL10560@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312027319-1402-1-git-send-email-minipli@googlemail.com>
 <CA+rthh_AW5Yz2ZiOqOTWquXKnsDEd=YcNQ9HiOWu-deSar0eWQ@mail.gmail.com>
In-Reply-To: <CA+rthh_AW5Yz2ZiOqOTWquXKnsDEd=YcNQ9HiOWu-deSar0eWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathias Krause <minipli@googlemail.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> On Sat, Jul 30, 2011 at 2:01 PM, Mathias Krause <minipli@googlemail.com> wrote:
> > Even though this is valid C we should not mix C99 initializers with
> > obfuscated ANSI C.

I saw this patch the first time and I couldn't figure out why the
original code was written that way.  I'm curious, is there some trick
here that I don't see, or is it just a typo that happens to work?

regards,
dan carpenter
