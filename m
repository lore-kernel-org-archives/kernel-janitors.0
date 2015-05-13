From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Date: Wed, 13 May 2015 11:58:25 +0000
Subject: Re: netns: use a spin_lock to protect nsid management
Message-Id: <55533C61.2030206@6wind.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150512175227.GA19020@mwanda> <CAM_iQpUSgpeL_Dy+U+KrBd=h3bhm03vASupdO-9dSs+CKYjNeg@mail.gmail.com>
In-Reply-To: <CAM_iQpUSgpeL_Dy+U+KrBd=h3bhm03vASupdO-9dSs+CKYjNeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Cong Wang <xiyou.wangcong@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Linux Kernel Network Developers <netdev@vger.kernel.org>

Le 12/05/2015 21:16, Cong Wang a =C3=A9crit :
[snip]
> Also why do we have to disable IRQ when holding the spinlock?
> IOW, which case takes the spin lock in IRQ context?
peernet2id() is called by do_one_broadcast() (net/netlink/af_netlink.c). So
every callers of netlink_broadcast[_filtered]()/nlmsg_unicast()
/nlmsg_multicast() may needs this lock.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
