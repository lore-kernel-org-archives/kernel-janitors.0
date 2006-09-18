From: "Om Narasimhan" <om.turyx@gmail.com>
Date: Mon, 18 Sep 2006 22:54:17 +0000
Subject: Re: [KJ] potential crash fix : drivers/pcmcia/au1000_generic
Message-Id: <6b4e42d10609181554s723b54f4y97a233a0a1f30657@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10609171754p4054762bm5711c744b61e68a0@mail.gmail.com>
	 <20060918110812.GP2585@parisc-linux.org>
In-Reply-To: <20060918110812.GP2585@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: linux-pcmcia@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

On 9/18/06, Matthew Wilcox <matthew@wil.cx> wrote:
> On Sun, Sep 17, 2006 at 05:54:17PM -0700, Om Narasimhan wrote:
> > Tested by compiling.
> >
> > I have not subscribed to pcmcia list. Please cc me any comments.
>
> You also haven't described what the 'potential crach' is that you're
> fixing.
Okay, I should have documented that.
Here is the explanation.
The previous code did something like,

if (error) goto out_err;
....
do {
             struct au1000_pcmcia_socket *skt = PCMCIA_SOCKET(i);
              del_timer_sync(&skt->poll_timer);
               pcmcia_unregister_socket(&skt->socket);
out_err:
               flush_scheduled_work();
               ops->hw_shutdown(skt);
               i--;
} while (i > 0)
.....

1. On the error path, skt would not contain a valid value for the
first iteration (skt is masked by uninitialized automatic skt)
2. does not do hw_shutdown() for 0th element of PCMCIA_SOCKET

Does it sound good?

Regards,
Om.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
