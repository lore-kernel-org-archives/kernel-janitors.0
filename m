From: Jan Engelhardt <jengelh@computergmbh.de>
Date: Wed, 09 Jan 2008 12:14:25 +0000
Subject: Re: [PATCH] Change paride driver to use unlocked_ioctl instead of
Message-Id: <Pine.LNX.4.64.0801091313231.29244@fbirervta.pbzchgretzou.qr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4785B7BC.5040106@suse.de>  <20080109080620.GE32560@infradead.org>
  <4784D3E0.BANGALORE.BLR.100.174746A.1.EABB.1@1:7.BANGALORE.BLR.100.0.1.0.1@16>
 <1199955347.6203.6.camel@nikanth-laptop.blr.novell.com>
In-Reply-To: <1199955347.6203.6.camel@nikanth-laptop.blr.novell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikanth Karthikesan <knikanth@suse.de>
Cc: grant@torque.net, tim@cyberelk.net, Christoph Hellwig <hch@infradead.org>, Valdis.Kletnieks@vt.edu, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


On Jan 10 2008 14:25, Nikanth Karthikesan wrote:
>-static int pt_ioctl(struct inode *inode, struct file *file,
>-	 unsigned int cmd, unsigned long arg)
>+static long pt_ioctl(struct file *file, unsigned int cmd,
>+		unsigned long arg)
> {
> 	struct pt_unit *tape = file->private_data;
> 	struct mtop __user *p = (void __user *)arg;
> 	struct mtop mtop;
>+	long err = 0;
>+
>+	lock_kernel();
> 
> 	switch (cmd) {
> 	case MTIOCTOP:
>-		if (copy_from_user(&mtop, p, sizeof(struct mtop)))
>-			return -EFAULT;
>+		if (copy_from_user(&mtop, p, sizeof(struct mtop))) {
>+			err = -EFAULT;
>+			break;
>+		}

I wonder why a simple copy_from_user() requires the BKL.. if pt
does need locking, then probably some mutex inside pt.

