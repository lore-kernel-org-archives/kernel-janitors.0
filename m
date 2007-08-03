From: Krzysztof Halasa <khc@pm.waw.pl>
Date: Fri, 03 Aug 2007 23:42:38 +0000
Subject: Re: dev->priv to netdev_priv(dev)
Message-Id: <m3lkcskwwh.fsf@maximus.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87r6mzmf6q.fsf@wanadoo.fr> <46AE43F5.8070802@garzik.org>
	<87myx8338m.fsf_-_@wanadoo.fr>
In-Reply-To: <87myx8338m.fsf_-_@wanadoo.fr> (Yoann Padioleau's message of "Fri, 03 Aug 2007 20:03:05 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: Jeff Garzik <jeff@garzik.org>, kernel-janitors@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

Yoann Padioleau <padator@wanadoo.fr> writes:

> drivers/net/wan/hdlc_fr.c               

hdlc_fr (PVC device) uses dev->priv for N:1 mappings (a single pvc
structure may be referenced as dev->priv by multiple (up to 2
currently) PVC devs).

> drivers/net/wan/hdlc_ppp.c              

hdlc_ppp obviously has to do some tricks to use syncppp:
static int ppp_open(struct net_device *dev)
{
        hdlc_device *hdlc = dev_to_hdlc(dev);
        void *old_ioctl;
        int result;

        dev->priv = &state(hdlc)->syncppp_ptr;
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        state(hdlc)->syncppp_ptr = &state(hdlc)->pppdev;
        state(hdlc)->pppdev.dev = dev;

        old_ioctl = dev->do_ioctl;
        state(hdlc)->old_change_mtu = dev->change_mtu;
        sppp_attach(&state(hdlc)->pppdev);

Perhaps I should remove that and make a sane interface in syncppp.
-- 
Krzysztof Halasa
