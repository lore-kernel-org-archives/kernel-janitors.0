From: Marcel Holtmann <marcel@holtmann.org>
Date: Fri, 23 Jan 2009 14:22:09 +0000
Subject: Re: [PATCH] Fix unused variable warning in rfcomm
Message-Id: <BEC94463-F21B-4B9A-BB4F-248ECF9D8329@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090123140946.GA31355@milesteg.arr>
In-Reply-To: <20090123140946.GA31355@milesteg.arr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniele Venzano <venza@brownhat.org>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, richard.genoud@gmail.com, linux-bluetooth@vger.kernel.org

Hi guys,

> Sorry, shouldn't have missed that.
>
> The following patch fixes a warning generated when compiling rfcomm.c
> without CONFIG_BT_RFCOMM_DEBUG.
> The warning was:
> net/bluetooth/rfcomm/sock.c: In function 'rfcomm_sock_ioctl':
> net/bluetooth/rfcomm/sock.c:795: warning: unused variable 'sk'

this has been fixed upstream already. So why does this come up again?

Regards

Marcel

