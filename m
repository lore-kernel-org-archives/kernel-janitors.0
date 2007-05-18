From: "pradeep singh" <2500.pradeep@gmail.com>
Date: Fri, 18 May 2007 11:52:02 +0000
Subject: [KJ] alloc_netdev() and 32 byte or 32 bit alignment???
Message-Id: <366312910705180440q2b4daf7awc8fbcfab25d59ef1@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi ,

following code snippet is self evident in what it does -

truct net_device *alloc_netdev(int sizeof_priv, const char *name,
		void (*setup)(struct net_device *))
{
	void *p;
	struct net_device *dev;
	int alloc_size;

	/* ensure 32-byte alignment of both the device and private area */
	alloc_size = (sizeof(*dev) + NETDEV_ALIGN_CONST) & ~NETDEV_ALIGN_CONST;
	alloc_size += sizeof_priv + NETDEV_ALIGN_CONST;

	p = kzalloc(alloc_size, GFP_KERNEL);
	if (!p) {
		printk(KERN_ERR "alloc_dev: Unable to allocate device.\n");
		return NULL;
	}
[snip]

Is the comment correct?
Why is it 'ensure 32 byte alignment', instead of 32 bit alignment?

What am i missing here?

Thank you
--psr



-- 
play the game
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
