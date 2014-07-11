From: Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Date: Fri, 11 Jul 2014 12:43:12 +0000
Subject: Re: [PATCH] drivers/staging/comedi/drivers/ni_atmio16d.c: remove pointless condition
Message-Id: <1405082594.21735.1.camel@thorin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405073603-21468-1-git-send-email-andrey.krieger.utkin@gmail.com>
	 <53BFD1FF.20309@mev.co.uk>
	 <CANZNk82rsdbg+zQGQODmNMpScaHZiZ8MeooGWabWZPGwzErCyQ@mail.gmail.com>
In-Reply-To: <CANZNk82rsdbg+zQGQODmNMpScaHZiZ8MeooGWabWZPGwzErCyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: Ian Abbott <abbotti@mev.co.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, OSUOSL Drivers <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, hsweeten@visionengravers.com, dcb314@hotmail.com

Hi!

On Fre, 2014-07-11 at 15:30 +0300, Andrey Utkin wrote:
[...]
> Could you please substantiate this? I see that convert_arg has type
> "unsigned int" which may be 8 bytes on 64-bit platform. I haven't

At least in the x86_64 world, "unsigned int" has 32bit.
TTBOMK, it is similar on all other 64bit - otherwise there is no way to
address 32bit ("short int" is usually 16 bit).

	Bernd
-- 
"I dislike type abstraction if it has no real reason. And saving
on typing is not a good reason - if your typing speed is the main
issue when you're coding, you're doing something seriously wrong."
    - Linus Torvalds

