From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Date: Wed, 13 May 2015 11:37:21 +0000
Subject: Re: netns: use a spin_lock to protect nsid management
Message-Id: <55533771.6080406@6wind.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150512175227.GA19020@mwanda>
In-Reply-To: <20150512175227.GA19020@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, netdev <netdev@vger.kernel.org>

Le 12/05/2015 19:52, Dan Carpenter a =E9crit :
> Hello Nicolas Dichtel,
>
> The patch 95f38411df05: "netns: use a spin_lock to protect nsid
> management" from May 7, 2015, leads to the following static checker
> warning:
>
> 	net/core/net_namespace.c:580 rtnl_net_newid()
> 	warn: inconsistent returns 'spin_lock:&nsid_lock'.
>
> net/core/net_namespace.c
>     565
>     566          spin_lock_irqsave(&nsid_lock, flags);
>     567          if (__peernet2id(net, peer) >=3D 0) {
>     568                  err =3D -EEXIST;
>     569                  goto out;
>
> I don't know if __peernet2id() unlocks on error but it can't possibly
> restore flags so this isn't right.
It's a bug. I will send a patch.

Thank you for the report.

Nicolas
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
