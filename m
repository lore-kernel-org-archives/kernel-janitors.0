From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Wed, 16 Aug 2006 19:39:15 +0000
Subject: Re: [KJ] [PATCH] Y/N value import/export
Message-Id: <9a8748490608161239p69130833qf5897fc7b84524fd@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060816170423.GA5897@plankton.ifup.org>
In-Reply-To: <20060816170423.GA5897@plankton.ifup.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 16/08/06, Brandon Philips <brandon@ifup.org> wrote:
> On 11:34 Wed 16 Aug 2006, Matthew Wilcox wrote:
> > On Wed, Aug 16, 2006 at 12:04:45PM -0500, Brandon Philips wrote:
> > > I am wanting to export a single Y/N value via sysfs like
> > > debugfs_create_bool does.
> >
> > Why not 0/1 like the rest of the kernel does?
>
> I couldn't find an example of a boolean values exported via sysfs.
> Could you point me to an attr that uses 0/1 values?
>
in net/core/net-sysfs.c :

static ssize_t show_carrier(struct class_device *dev, char *buf)
{
        struct net_device *netdev = to_net_dev(dev);
        if (netif_running(netdev)) {
                return sprintf(buf, fmt_dec, !!netif_carrier_ok(netdev));
        }
        return -EINVAL;
}


-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
