From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Sat, 04 Feb 2006 15:19:53 +0000
Subject: Re: [KJ] [PATCH] MODULE_VERSION()
Message-Id: <9a8748490602040719r170bce54k6b88482509491e4@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139062125.8030.4.camel@localhost.localdomain>
In-Reply-To: <1139062125.8030.4.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/4/06, Matthew Martin <lihnucks@gmail.com> wrote:
> OK, Sorry about last time. Here it is. Could you please tell me what
> you mean by "the filenames need to begin with linux-x.y.z/" Is that
> 2.6.x or something else?
>

What is meant is that your patches should be generated so they apply
with 'patch -p1' from inside the source dir.

> --- /home/matthew/src/linux-2.6.15.2/drivers/usb/storage/usb.c

^^^ that should be

--- linux-2.6.15.2/drivers/usb/storage/usb.c


You seem to be doing

diff -up /home/matthew/src/linux-2.6.15.2/drivers/usb/storage/usb.c \
/home/matthew/linux-2.6.15.2/drivers/usb/storage/usb.c

Where instead you should be doing something like

cd /home/matthew/
diff -up linux-2.6.15.2/drivers/usb/storage/usb.c.old \
linux-2.6.15.2/drivers/usb/storage/usb.c

or

cd /home/matthew/
diff -up linux-2.6.15.2-original/drivers/usb/storage/usb.c \
linux-2.6.15.2/drivers/usb/storage/usb.c

See the difference?


--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
